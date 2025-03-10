import { CoursePopupProps } from './coursetypes';
import { useState, useEffect, useCallback, useRef } from 'react';
import { PrerequisiteRenderer } from './prerequisite-renderer';
import { PrerequisiteNode } from './coursetypes';
import { Course } from './coursetypes';

export default function CoursePopup({ course, term, onClose, onDelete, onGradeChange }: CoursePopupProps) {
  const [currentGrade, setCurrentGrade] = useState<string | null>(course.grade || null);
  const [completedCourses, setCompletedCourses] = useState<Course[]>([]);
  const [prerequisitesNode, setPrerequisitesNode] = useState<PrerequisiteNode | null>(null);
  const hasLoadedPrerequisites = useRef(false);
  const [isLoading, setIsLoading] = useState(true);

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

  // Fetch course prerequisites only once when the popup is opened
  useEffect(() => {
    const fetchCoursePrerequisites = async () => {
      setIsLoading(true);
      // Only fetch if we haven't loaded prerequisites yet
      if (!hasLoadedPrerequisites.current && course.id) {
        try {
          console.log("Fetching prerequisites for course:", course.id);
          const response = await fetch(`/api/course/${course.id}`);
          if (response.ok) {
            const data = await response.json();
            if (data.course && data.course.prerequisites) {
              console.log("Received prerequisites:", data.course.prerequisites);
              // Update the course object with prerequisites
              course.prerequisites = data.course.prerequisites;
              setPrerequisitesNode(getPrerequisitesNode(data.course.prerequisites));
            } else {
              console.log("No prerequisites found in API response");
              setPrerequisitesNode(null);
            }
          } else {
            console.error("Failed to fetch course data:", response.status);
          }
          // Mark as loaded so we don't fetch again
          hasLoadedPrerequisites.current = true;
        } catch (error) {
          console.error('Error fetching course prerequisites:', error);
        } finally {
          setIsLoading(false);
        }
      } else if (course.prerequisites) {
        // If prerequisites are already available, just set them
        setPrerequisitesNode(getPrerequisitesNode(course.prerequisites));
        hasLoadedPrerequisites.current = true;
        setIsLoading(false);
      } else {
        setIsLoading(false);
      }
    };

    fetchCoursePrerequisites();
  }, [course, getPrerequisitesNode]);

  // Fetch the latest completed courses directly from the API
  useEffect(() => {
    const fetchCompletedCourses = async () => {
      try {
        const response = await fetch('/api/user/courses');
        if (response.ok) {
          const data = await response.json();
          if (data && data.courses && Array.isArray(data.courses)) {
            // Get all course IDs
            const courseIds = data.courses.map((c: Record<string, unknown>) => c.id);
            
            // Fetch full course details
            const coursesResponse = await fetch('/api/course/query/batch', {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json',
              },
              body: JSON.stringify({ courseIds }),
            });
            
            if (coursesResponse.ok) {
              const coursesData = await coursesResponse.json();
              if (coursesData.courses && Array.isArray(coursesData.courses)) {
                const allCourses: Course[] = coursesData.courses.map((c: Record<string, unknown>) => ({
                  id: Number(c.id),
                  gold_id: String(c.gold_id),
                  title: String(c.title),
                  description: String(c.description),
                  subjectArea: String(c.subject_area),
                  units: Number(c.units) || 0,
                  generalEd: Array.isArray(c.general_ed) ? c.general_ed : [],
                  prerequisites: c.prerequisites ? (c.prerequisites as unknown as PrerequisiteNode | null) : null,
                  unlocks: Array.isArray(c.unlocks) ? c.unlocks.map(String) : [],
                  term: []
                }));
                
                console.log("Fetched completed courses:", allCourses.length);
                setCompletedCourses(allCourses);
              }
            }
          }
        }
      } catch (error) {
        console.error('Error fetching completed courses:', error);
      }
    };
    
    fetchCompletedCourses();
    
    // Set up an interval to periodically refresh completed courses
    const intervalId = setInterval(fetchCompletedCourses, 5000); // Refresh every 5 seconds
    return () => clearInterval(intervalId);
  }, []);

  const handleGradeChange = (grade: string | null) => {
    setCurrentGrade(grade);
    onGradeChange(grade);
  };

  const hasPrerequisites = prerequisitesNode !== null;

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" onClick={onClose}>
      <div className="bg-white p-6 rounded-lg shadow-xl max-w-md w-full m-4 relative" onClick={e => e.stopPropagation()}>
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
          
          <div className="mb-3">
            <strong>Prerequisites:</strong>
            {isLoading ? (
              <div className="mt-2 p-4 flex items-center justify-center">
                <div className="animate-spin rounded-full h-6 w-6 border-b-2 border-blue-500 mr-2"></div>
                <span>Loading prerequisites...</span>
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
