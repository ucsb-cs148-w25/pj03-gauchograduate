import React, { useEffect, useState, useCallback } from 'react';
import { PrerequisiteNode, CourseInfo, Course } from './coursetypes';

// Create a global cache for course ID mappings
const globalCourseIdCache: Record<string, string> = {};

interface Props {
  node: PrerequisiteNode;
  depth?: number; // used to indent nested requirements
  completedCourses?: Course[]; // Add this prop to highlight completed courses
}

const INDENT_PER_LEVEL = 12;

export const PrerequisiteRenderer: React.FC<Props> = ({ node, depth = 0, completedCourses = [] }) => {
  const [courseIdMap, setCourseIdMap] = useState<Record<string, string>>({});
  const [isLoading, setIsLoading] = useState(false);
  
  // Create a set of completed course IDs for faster lookups
  const completedCourseIds = new Set(
    completedCourses.map(course => String(course.id))
  );
  
  // Function to collect all course IDs from the prerequisite tree
  const collectCourseIds = useCallback((n: PrerequisiteNode, ids: string[] = []) => {
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
      
      // Check which IDs we need to fetch (not in cache)
      const idsToFetch = courseIds.filter(id => !globalCourseIdCache[id]);
      
      // If all IDs are already in the cache, use the cache
      if (idsToFetch.length === 0) {
        const cachedMap: Record<string, string> = {};
        courseIds.forEach(id => {
          cachedMap[id] = globalCourseIdCache[id];
        });
        setCourseIdMap(cachedMap);
        return;
      }
      
      // Otherwise, fetch the missing IDs
      setIsLoading(true);
      try {
        // Convert string IDs to numbers
        const numericIds = idsToFetch.map(id => parseInt(id, 10)).filter(id => !isNaN(id));
        
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
          const newIdMap: Record<string, string> = {};
          
          if (data.courses && Array.isArray(data.courses)) {
            data.courses.forEach((course: CourseInfo) => {
              const id = course.id.toString();
              const goldId = course.gold_id;
              newIdMap[id] = goldId;
              
              // Update the global cache
              globalCourseIdCache[id] = goldId;
            });
          }
          
          // Combine new mappings with cached mappings
          const combinedMap: Record<string, string> = { ...newIdMap };
          courseIds.forEach(id => {
            if (globalCourseIdCache[id] && !combinedMap[id]) {
              combinedMap[id] = globalCourseIdCache[id];
            }
          });
          
          setCourseIdMap(combinedMap);
        }
      } catch (error) {
        console.error('Error fetching course information:', error);
      } finally {
        setIsLoading(false);
      }
    };
    
    fetchCourseInfo();
  }, [node, collectCourseIds]);

  // Debug logging for completed courses
  console.log(`PrerequisiteRenderer at depth ${depth}:`, node);
  console.log('Course ID map:', courseIdMap);
  console.log('Global cache size:', Object.keys(globalCourseIdCache).length);
  console.log('Completed course IDs:', Array.from(completedCourseIds));
  console.log('Completed courses:', completedCourses.map(c => ({ id: c.id, gold_id: c.gold_id })));

  // helper style for nested indentation
  const style = { marginLeft: depth * INDENT_PER_LEVEL };

  if (!node || typeof node !== 'object') {
    console.log("Invalid node:", node);
    return null;
  }

  switch (node.type) {
    case 'course': {
      // Render a single course requirement
      // Display the gold_id if available, otherwise show the internal ID
      const displayId = courseIdMap[node.id] || globalCourseIdCache[node.id] || `Course ID: ${node.id}`;
      
      // Check if this course is in the completed courses list
      const isCourseCompleted = completedCourseIds.has(String(node.id));
      
      console.log(`Checking if course ${node.id} is completed:`, isCourseCompleted);
      
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
      console.log("Unknown node type:", node);
      return (
        <div className="text-red-500">
          Unknown prerequisite type: {String((node as Record<string, unknown>).type || 'undefined')}
        </div>
      );
  }
};
