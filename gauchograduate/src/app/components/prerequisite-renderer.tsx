import React, { useEffect, useState, useCallback, useMemo } from 'react';
import { PrerequisiteNode, CourseInfo, Course } from './coursetypes';

interface Props {
  node: PrerequisiteNode;
  depth?: number; // used to indent nested requirements
  completedCourses?: Course[]; // Add this prop to highlight completed courses
}

const INDENT_PER_LEVEL = 12;

// Cache for course ID to gold_id mapping
const courseIdMapCache: Record<string, string> = {};

export const PrerequisiteRenderer: React.FC<Props> = ({ node, depth = 0, completedCourses = [] }) => {
  const [courseIdMap, setCourseIdMap] = useState<Record<string, string>>({});
  const [isLoading, setIsLoading] = useState(false);
  
  // Create a set of completed course IDs for faster lookups
  const completedCourseIds = useMemo(() => {
    return new Set(completedCourses.map(course => String(course.id)));
  }, [completedCourses]);
  
  // Function to collect all course IDs from the prerequisite tree
  const collectCourseIds = useCallback((n: PrerequisiteNode, ids: string[] = []): string[] => {
    if (n.type === 'course') {
      ids.push(n.id);
    } else if (n.type === 'and' || n.type === 'or') {
      n.requirements.forEach(req => collectCourseIds(req, ids));
    }
    return ids;
  }, []);
  
  // Fetch course information for all course IDs in the prerequisites
  useEffect(() => {
    const fetchCourseInfo = async () => {
      if (!node) return;
      
      // Collect all course IDs from the prerequisite tree
      const courseIds = collectCourseIds(node);
      
      if (courseIds.length === 0) return;
      
      // Filter out IDs that are already in the cache
      const idsToFetch = courseIds.filter(id => !courseIdMapCache[id]);
      
      if (idsToFetch.length === 0) {
        // All IDs are already in the cache
        setCourseIdMap({...courseIdMapCache});
        return;
      }
      
      setIsLoading(true);
      try {
        // Convert string IDs to numbers
        const numericIds = idsToFetch.map(id => parseInt(id, 10)).filter(id => !isNaN(id));
        if(numericIds.length === 0) return;
        
        // Fetch course information for these IDs
        const response = await fetch('/api/course/query/batch', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ courseIds: numericIds }),
        });
        
        if (response.ok) {
          const data = await response.json();
          
          if (data.courses && Array.isArray(data.courses)) {
            data.courses.forEach((course: CourseInfo) => {
              const id = course.id.toString();
              const goldId = course.gold_id;
              courseIdMapCache[id] = goldId;
            });
          }
          
          setCourseIdMap({...courseIdMapCache});
        }
      } catch (error) {
        console.error('Error fetching course information:', error);
      } finally {
        setIsLoading(false);
      }
    };
    
    fetchCourseInfo();
  }, [node, collectCourseIds]);

  // helper style for nested indentation
  const style = { marginLeft: depth * INDENT_PER_LEVEL };

  if (!node || typeof node !== 'object') {
    return null;
  }

  switch (node.type) {
    case 'course': {
      // Render a single course requirement
      // Display the gold_id if available, otherwise show the internal ID
      const displayId = courseIdMap[node.id] || `Course ID: ${node.id}`;
      
      // Check if this course is in the completed courses list
      const isCourseCompleted = completedCourseIds.has(String(node.id));
      
      return (
        <li style={style}>
          <span className={`font-medium ${isCourseCompleted ? 'bg-green-200 px-1 py-0.5 rounded' : ''}`}>
            {isLoading ? "Loading..." : displayId}
          </span>
          {node.minGrade && node.minGrade !== 'Na' && (
            <span className="text-sm ml-1">(Min grade: {node.minGrade})</span>
          )}
          {node.canTakeConcurrently && (
            <span className="text-sm ml-1 text-blue-600">
              (Can be taken concurrently)
            </span>
          )}
          {isCourseCompleted && (
            <span className="text-sm ml-1 text-green-600">
              ✓ Completed
            </span>
          )}
        </li>
      );
    }

    case 'specialRequirement': {
      // Render a special requirement (like AP exam scores)
      return (
        <li style={style}>
          <span className="font-medium text-purple-600">{node.requirement}</span>
        </li>
      );
    }

    case 'and': {
      // All requirements must be met
      return (
        <div style={style} className="border-l-2 border-blue-300 pl-3 my-2">
          <div className="font-semibold mb-1">AND - All of these must be met:</div>
          <ul className="list-disc pl-5">
            {node.requirements && node.requirements.map((req, idx) => (
              <PrerequisiteRenderer 
                key={idx} 
                node={req} 
                depth={depth + 1} 
                completedCourses={completedCourses}
              />
            ))}
          </ul>
        </div>
      );
    }

    case 'or': {
      // Any one of the subrequirements is enough
      return (
        <div style={style} className="border-l-2 border-orange-300 pl-3 my-2">
          <div className="font-semibold mb-1">OR - One of these must be met:</div>
          <ul className="list-disc pl-5">
            {node.requirements && node.requirements.map((req, idx) => (
              <PrerequisiteRenderer 
                key={idx} 
                node={req} 
                depth={depth + 1}
                completedCourses={completedCourses}
              />
            ))}
          </ul>
        </div>
      );
    }

    default:
      return (
        <div className="text-red-500">
          Unknown prerequisite type: {String((node as Record<string, unknown>).type || 'undefined')}
        </div>
      );
  }
};
