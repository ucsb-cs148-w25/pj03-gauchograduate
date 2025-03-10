import { CoursePopupProps } from './coursetypes';
import { useState, useEffect, useCallback } from 'react';
import { PrerequisiteRenderer } from './prerequisite-renderer';
import { PrerequisiteNode } from './coursetypes';
import { useSession } from 'next-auth/react';
import { Terms, Years, Course } from './coursetypes';

export default function CoursePopup({ course, term, onClose, onDelete, onGradeChange }: CoursePopupProps) {
  const [currentGrade, setCurrentGrade] = useState<string | null>(course.grade || null);
  const { data: session } = useSession();
  const [completedCourses, setCompletedCourses] = useState<Course[]>([]);
  const [prerequisitesNode, setPrerequisitesNode] = useState<PrerequisiteNode | null>(null);

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

  // Extract prerequisite node when course changes
  useEffect(() => {
    setPrerequisitesNode(getPrerequisitesNode(course.prerequisites));
  }, [course.prerequisites, getPrerequisitesNode]);

  // Collect completed courses from previous terms and current term
  useEffect(() => {
    if (session?.user?.courses) {
      const allCourses: Course[] = [];
      const studentSchedule = session.user.courses;
      const firstQuarter = studentSchedule.firstQuarter || '20224';
      
      // Helper function to get year and term from quarter code
      const getYearAndTerm = (quarterCode: string) => {
        const year = parseInt(quarterCode.substring(0, 4));
        const quarter = quarterCode.substring(4);
        const firstYear = parseInt(firstQuarter.substring(0, 4));
        const yearDiff = year - firstYear;
        
        const yearMap: { [key: number]: string } = {
          0: "Year 1",
          1: "Year 2",
          2: "Year 3",
          3: "Year 4"
        };
        
        const termMap: { [key: string]: string } = {
          "1": "Winter",
          "2": "Spring",
          "3": "Summer",
          "4": "Fall"
        };
        
        return {
          year: yearMap[yearDiff] || "Year 1",
          term: termMap[quarter] || "Fall"
        };
      };
      
      // Get current course's quarter code
      const currentQuarterCode = studentSchedule.courses.find(
        (c: Record<string, unknown>) => c.id === course.id && c.quarter
      )?.quarter;
      
      if (currentQuarterCode) {
        const currentPosition = getYearAndTerm(currentQuarterCode as string);
        
        // Add all courses from previous terms and years
        studentSchedule.courses.forEach((savedCourse: Record<string, unknown>) => {
          if (savedCourse.quarter && savedCourse.id) {
            const position = getYearAndTerm(savedCourse.quarter as string);
            
            // Check if this course is from a previous term or concurrent
            const yearIndex = Years.indexOf(position.year);
            const currentYearIndex = Years.indexOf(currentPosition.year);
            const termIndex = Terms.indexOf(position.term);
            const currentTermIndex = Terms.indexOf(currentPosition.term);
            
            const isPreviousYear = yearIndex < currentYearIndex;
            const isSameYearPreviousTerm = yearIndex === currentYearIndex && termIndex <= currentTermIndex;
            
            if (isPreviousYear || isSameYearPreviousTerm) {
              // Convert the saved course to a Course object
              const courseObj: Course = {
                id: Number(savedCourse.id),
                gold_id: String(savedCourse.gold_id || ''),
                title: String(savedCourse.title || ''),
                description: String(savedCourse.description || ''),
                subjectArea: String(savedCourse.subjectArea || ''),
                units: Number(savedCourse.units || 0),
                generalEd: Array.isArray(savedCourse.generalEd) ? savedCourse.generalEd : [],
                prerequisites: savedCourse.prerequisites || null,
                unlocks: Array.isArray(savedCourse.unlocks) ? savedCourse.unlocks.map(String) : [],
                term: []
              };
              allCourses.push(courseObj);
            }
          }
        });
        
        setCompletedCourses(allCourses);
      }
    }
  }, [session, course.id]);

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
            {hasPrerequisites && prerequisitesNode ? (
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
