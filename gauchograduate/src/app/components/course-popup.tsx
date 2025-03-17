import { CoursePopupProps } from './coursetypes';
import { useState, useEffect, useCallback } from 'react';
import { PrerequisiteRenderer } from './prerequisite-renderer';
import { PrerequisiteNode, Course } from './coursetypes';

export default function CoursePopup({ course, term, onClose, onDelete, onGradeChange, studentSchedule }: CoursePopupProps) {
  const [currentGrade, setCurrentGrade] = useState<string | null>(course.grade || null);
  const [completedCourses, setCompletedCourses] = useState<Course[]>([]);
  const [prerequisitesNode, setPrerequisitesNode] = useState<PrerequisiteNode | null>(null);
  const [isLoading, setIsLoading] = useState(false);

  // Update local state if course prop changes
  useEffect(() => {
    setCurrentGrade(course.grade || null);
  }, [course.grade]);

  // Function to extract prerequisite node
  const getPrerequisitesNode = useCallback((prerequisites: unknown): PrerequisiteNode | null => {
    if (!prerequisites) return null;
    
    if (typeof prerequisites === 'object' && prerequisites !== null) {
      const prereqObj = prerequisites as Record<string, unknown>;
      
      if (prereqObj.type && 
          (prereqObj.type === 'course' || 
           prereqObj.type === 'and' || 
           prereqObj.type === 'or' || 
           prereqObj.type === 'specialRequirement')) {
        return prerequisites as PrerequisiteNode;
      }
      
      if (prereqObj.course && prereqObj.prerequisites) {
        return prereqObj.prerequisites as unknown as PrerequisiteNode;
      }
    }
    
    return null;
  }, []);

  // Set prerequisites from course data if available, or fetch if needed
  useEffect(() => {
    const setupPrerequisites = async () => {
      // If course already has prerequisites, use them directly
      if (course.prerequisites) {
        const node = getPrerequisitesNode(course.prerequisites);
        if (node) {
          setPrerequisitesNode(node);
          return;
        }
      }
      
      // Only fetch if we need to
      if (course.id) {
        setIsLoading(true);
        try {
          const response = await fetch(`/api/course/${course.id}`);
          if (response.ok) {
            const data = await response.json();
            if (data.course && data.course.prerequisites) {
              // Update the course object with prerequisites
              course.prerequisites = data.course.prerequisites;
              setPrerequisitesNode(getPrerequisitesNode(data.course.prerequisites));
            } else {
              setPrerequisitesNode(null);
            }
          }
        } catch (error) {
          console.error('Error fetching course prerequisites:', error);
        } finally {
          setIsLoading(false);
        }
      } else {
        setIsLoading(false);
      }
    };

    setupPrerequisites();
  }, [course, getPrerequisitesNode]);

  // Extract completed courses from the student schedule
  useEffect(() => {
    if (studentSchedule) {
      const allCourses: Course[] = [];
      
      Object.values(studentSchedule).forEach(yearSchedule => {
        Object.values(yearSchedule).forEach(termCourses => {
          allCourses.push(...termCourses);
        });
      });
      
      setCompletedCourses(allCourses);
    }
  }, [studentSchedule]);

  const handleGradeChange = (grade: string | null) => {
    setCurrentGrade(grade);
    onGradeChange(grade);
  };

  const hasPrerequisites = prerequisitesNode !== null;

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" onClick={onClose}>
      <div className="bg-white p-6 rounded-lg shadow-xl max-w-md w-full m-4 relative max-h-[90vh] overflow-y-auto" onClick={e => e.stopPropagation()}>
        {/* Close button in top right */}
        <button 
          onClick={onClose}
          className="float-right top-4 right-4 text-gray-500 hover:text-gray-700 transition-colors"
          aria-label="Close popup"
        >
          <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>

        <div className="mb-4">
          <h3 className="text-xl font-bold">{course.gold_id}</h3>
        </div>
        
        <div className="space-y-3">
          <p className="text-lg">{course.title}</p>
          <p className="text-gray-600">{course.description}</p>
          <p className="text-gray-600">{course.units} units</p>
          <p className="text-sm text-gray-500">Term: {term}</p>
          {course.generalEd.length > 0 && (
            <div className="text-sm text-gray-500">
              <p>General Education Requirements:</p>
              <ul className="list-disc pl-5">
                {course.generalEd.map((ge, index) => (
                  <li key={index}>{ge.geCode} ({ge.geCollege})</li>
                ))}
              </ul>
            </div>
          )}
          
          <div className="mb-3 relative">
            <strong>Prerequisites:</strong>
            {isLoading ? (
              <div className="mt-2 bg-white bg-opacity-70 p-4 flex items-center justify-center">
                <div className="text-lg font-medium text-gray-600 animate-pulse flex items-center">
                  <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  Loading prerequisites...
                </div>
              </div>
            ) : hasPrerequisites && prerequisitesNode ? (
              <div className="mt-2 bg-gray-50 p-3 rounded-lg">
                <div className="mb-3 text-xs bg-gray-100 p-2 rounded border border-gray-200">
                  <div className="font-semibold mb-1">Key:</div>
                  <div className="flex items-center mb-1">
                    <div className="w-3 h-3 bg-blue-300 mr-2" />
                    <span>AND - All conditions must be met</span>
                  </div>
                  <div className="flex items-center mb-1">
                    <div className="w-3 h-3 bg-orange-300 mr-2" />
                    <span>OR - Any one condition must be met</span>
                  </div>
                  <div className="flex items-center">
                    <div className="w-3 h-3 bg-purple-300 mr-2" />
                    <span>Special requirements (AP scores, etc.)</span>
                  </div>
                  <div className="flex items-center mt-1">
                    <div className="w-3 h-3 bg-green-200 mr-2" />
                    <span>Completed prerequisites</span>
                  </div>
                </div>

                <PrerequisiteRenderer 
                  node={prerequisitesNode} 
                  completedCourses={completedCourses}
                />
              </div>
            ) : (
              <span> None</span>
            )}
          </div>
        </div>
        
        <div className="mt-6 flex justify-between items-center">
          {/* Grade selector moved to bottom left */}
          <div className="flex items-center border border-gray-300 rounded-lg overflow-hidden">
            <label htmlFor="grade-select" className="bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 w-1/2">
              Grade
            </label>
            <select
              id="grade-select"
              className="p-2 border-0 focus:ring-0 focus:outline-none"
              value={currentGrade || ''}
              onChange={(e) => {
                e.stopPropagation();
                const grade = e.target.value || null;
                handleGradeChange(grade);
              }}
              onClick={(e) => e.stopPropagation()}
            >
              <option value="">N/A</option>
              <option value="A+">A+</option>
              <option value="A">A</option>
              <option value="A-">A-</option>
              <option value="B+">B+</option>
              <option value="B">B</option>
              <option value="B-">B-</option>
              <option value="C+">C+</option>
              <option value="C">C</option>
              <option value="C-">C-</option>
              <option value="D+">D+</option>
              <option value="D">D</option>
              <option value="D-">D-</option>
              <option value="F">F</option>
              <option value="P">P</option>
              <option value="NP">NP</option>
            </select>
          </div>
          
          {/* Delete button remains at bottom right */}
          <button
            onClick={onDelete}
            className="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-colors"
          >
            Remove Course
          </button>
        </div>
      </div>
    </div>
  );
}


