"use client";
import React, { useEffect, useState, useCallback, useRef } from "react";
import { Course, PrerequisiteNode, ScheduleType } from "./coursetypes"; 
import { PrerequisiteRenderer } from "./prerequisite-renderer"; 

interface CoursePreviewProps {
  course: Course;
  onClose: () => void;
  studentSchedule?: ScheduleType;
  saveStatus?: 'idle' | 'saving' | 'saved';
}

const CoursePreview: React.FC<CoursePreviewProps> = ({ course, onClose, studentSchedule, saveStatus }) => {
  const [completedCourses, setCompletedCourses] = useState<Course[]>([]);
  const [prerequisitesNode, setPrerequisitesNode] = useState<PrerequisiteNode | null>(null);
  const hasLoadedPrerequisites = useRef(false);
  const [isLoading, setIsLoading] = useState(true);

  const getPrerequisitesNode = useCallback((): PrerequisiteNode | null => {
    if (!course.prerequisites) return null;
    
    if (typeof course.prerequisites === 'object' && 
        'course' in (course.prerequisites as Record<string, unknown>) && 
        'prerequisites' in (course.prerequisites as Record<string, unknown>)) {
      return ((course.prerequisites as Record<string, unknown>).prerequisites as PrerequisiteNode);
    }
    
    if (typeof course.prerequisites === 'object' && 
        ('type' in (course.prerequisites as Record<string, unknown>))) {
      return course.prerequisites as PrerequisiteNode;
    }
    
    return null;
  }, [course.prerequisites]);

  useEffect(() => {
    const fetchCoursePrerequisites = async () => {
      setIsLoading(true);
      if (!hasLoadedPrerequisites.current && course.id) {
        try {
          console.log("CoursePreview - Fetching prerequisites for course:", course.id);
          const response = await fetch(`/api/course/${course.id}`);
          if (response.ok) {
            const data = await response.json();
            if (data.course && data.course.prerequisites) {
              console.log("CoursePreview - Received prerequisites:", data.course.prerequisites);
              course.prerequisites = data.course.prerequisites;
              setPrerequisitesNode(getPrerequisitesNode());
            } else {
              console.log("CoursePreview - No prerequisites found in API response");
              setPrerequisitesNode(null);
            }
          } else {
            console.error("CoursePreview - Failed to fetch course data:", response.status);
          }
          hasLoadedPrerequisites.current = true;
        } catch (error) {
          console.error('CoursePreview - Error fetching course prerequisites:', error);
        } finally {
          setIsLoading(false);
        }
      } else if (course.prerequisites) {
        setPrerequisitesNode(getPrerequisitesNode());
        hasLoadedPrerequisites.current = true;
        setIsLoading(false);
      } else {
        setIsLoading(false);
      }
    };

    fetchCoursePrerequisites();
  }, [course, getPrerequisitesNode]);

  useEffect(() => {
    console.log("CoursePreview - Course ID:", course.id);
    console.log("CoursePreview - Course Gold ID:", course.gold_id);
  }, [course]);

  useEffect(() => {
    if (studentSchedule) {
      const allCourses: Course[] = [];
      
      Object.values(studentSchedule).forEach(yearSchedule => {
        Object.values(yearSchedule).forEach(termCourses => {
          allCourses.push(...termCourses);
        });
      });
      
      console.log("CoursePreview - Updated completed courses from studentSchedule:", allCourses.length);
      setCompletedCourses(allCourses);
    }
  }, [studentSchedule, saveStatus]);

  const hasPrerequisites = prerequisitesNode !== null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center">
      <div className="absolute inset-0 bg-black opacity-50" onClick={onClose} />
      <div className="bg-white rounded-xl p-6 z-10 max-w-lg w-full shadow-lg max-h-[80vh] overflow-y-auto relative">
        <button
          onClick={onClose}
          className="absolute top-4 right-4 text-gray-500 hover:text-gray-700 transition-colors"
          aria-label="Close popup"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>

        <h2 className="text-xl font-bold mb-2">{course.gold_id}</h2>
        <p className="text-l font-bold mb-3">{course.title}</p>
        <p className="mb-3">
          <strong>Description:</strong> {course.description}
        </p>
        <p className="mb-3">
          <strong>Subject Area:</strong> {course.subjectArea}
        </p>
        <p className="mb-3">
          <strong>Units:</strong> {course.units}
        </p>

        <div className="mb-3">
          <strong>General Ed:</strong>{" "}
          {course.generalEd.length > 0 ? (
            <ul className="list-disc pl-5">
              {course.generalEd.map((ge, index) => (
                <li key={index}>
                  {ge.geCode} ({ge.geCollege})
                </li>
              ))}
            </ul>
          ) : (
            <span> None</span>
          )}
        </div>

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
                <div className="flex items-center mb-1">
                  <div className="w-3 h-3 bg-purple-300 mr-2" />
                  <span>Special requirements (AP scores, etc.)</span>
                </div>
                <div className="flex items-center">
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

        <p className="mb-1">
          <strong>Unlocks:</strong>{" "}
          {course.unlocks.length ? course.unlocks.join(", ") : "None"}
        </p>
      </div>
    </div>
  );
};

export default CoursePreview;


