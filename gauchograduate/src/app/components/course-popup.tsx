import { CoursePopupProps } from './coursetypes';
import { useState, useEffect } from 'react';

export default function CoursePopup({ course, term, onClose, onDelete, onGradeChange }: CoursePopupProps) {
  const [currentGrade, setCurrentGrade] = useState<string | null>(course.grade || null);

  // Update local state if course prop changes
  useEffect(() => {
    setCurrentGrade(course.grade || null);
  }, [course.grade]);

  const handleGradeChange = (grade: string | null) => {
    setCurrentGrade(grade);
    onGradeChange(grade);
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" onClick={onClose}>
      <div className="bg-white p-6 rounded-lg shadow-xl max-w-md w-full m-4 relative" onClick={e => e.stopPropagation()}>
        {/* Close button in top right */}
        <button 
          onClick={onClose}
          className="absolute top-4 right-4 text-gray-500 hover:text-gray-700 transition-colors"
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
            className="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition-colors"
          >
            Remove Course
          </button>
        </div>
      </div>
    </div>
  );
}
