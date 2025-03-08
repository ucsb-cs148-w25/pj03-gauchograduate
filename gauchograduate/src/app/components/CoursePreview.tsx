"use client";
import React, { useEffect } from "react";
import { Course, PrerequisiteNode } from "./coursetypes"; 
import { PrerequisiteRenderer } from "./prerequisite-renderer"; 

interface CoursePreviewProps {
  course: Course;
  onClose: () => void;
}

const CoursePreview: React.FC<CoursePreviewProps> = ({ course, onClose }) => {
  useEffect(() => {
    console.log("CoursePreview - Course ID:", course.id);
    console.log("CoursePreview - Course Gold ID:", course.gold_id);
    console.log("CoursePreview - Prerequisites:", course.prerequisites);
    
    const isNestedFormat = course.prerequisites && 
      typeof course.prerequisites === 'object' && 
      'course' in (course.prerequisites as Record<string, unknown>) && 
      'prerequisites' in (course.prerequisites as Record<string, unknown>);
    
    console.log("CoursePreview - Is nested format:", isNestedFormat);
    
    if (isNestedFormat) {
      const innerPrereqs = (course.prerequisites as Record<string, unknown>).prerequisites;
      console.log("CoursePreview - Inner prerequisites:", innerPrereqs);
      
      const hasTypeAndRequirements = innerPrereqs && 
        typeof innerPrereqs === 'object' && 
        'type' in (innerPrereqs as Record<string, unknown>) && 
        'requirements' in (innerPrereqs as Record<string, unknown>);
      
      console.log("CoursePreview - Inner prerequisites have type and requirements:", hasTypeAndRequirements);
      
      if (hasTypeAndRequirements) {
        const requirements = (innerPrereqs as Record<string, unknown>).requirements || [];
        const hasNestedRequirements = Array.isArray(requirements) && requirements.some((req: unknown) => 
          req && typeof req === 'object' && 
          ('type' in (req as Record<string, unknown>)) && 
          ((req as Record<string, unknown>).type === 'and' || (req as Record<string, unknown>).type === 'or') && 
          'requirements' in (req as Record<string, unknown>)
        );
        
        console.log("CoursePreview - Has nested requirements:", hasNestedRequirements);
        
        if (hasNestedRequirements) {
          console.log("CoursePreview - Nested requirements structure:", 
            Array.isArray(requirements) && requirements.map((req: unknown) => ({
              type: (req as Record<string, unknown>).type,
              requirementsCount: Array.isArray((req as Record<string, unknown>).requirements) 
                ? ((req as Record<string, unknown>).requirements as unknown[]).length 
                : 0
            }))
          );
        }
      }
    }
  }, [course]);

  const getPrerequisitesNode = (): PrerequisiteNode | null => {
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
  };
  
  const prerequisitesNode = getPrerequisitesNode();
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
              </div>

              <PrerequisiteRenderer node={prerequisitesNode} />
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
