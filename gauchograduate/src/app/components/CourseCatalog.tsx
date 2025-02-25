'use client';

import React, { useState, useEffect } from 'react';
import { Course, Term, ScheduleType } from "./coursetypes";

interface CourseCatalogProps {
  courses: Course[];
  selectedTerm: string;
  setSelectedTerm: (term: Term) => void;
  studentSchedule: ScheduleType;
}

export default function CourseCatalog({ courses, selectedTerm, setSelectedTerm, studentSchedule }: CourseCatalogProps) {
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedDepartment, setSelectedDepartment] = useState('');
  const [selectedCourse, setSelectedCourse] = useState<Course | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    if (courses.length > 0) {
      setIsLoading(false);
    }
  }, [courses]);

  useEffect(() => {
    const takenCourseIds = new Set(
      Object.values(studentSchedule)
        .flatMap(yearSchedule =>
          Object.values(yearSchedule)
            .flat()
            .map(course => course.gold_id)
        )
    );

    const filtered = courses.filter(course => {
      const searchMatches =
        course.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        course.gold_id.toLowerCase().includes(searchQuery.toLowerCase());
      const deptMatches = selectedDepartment === '' || course.subjectArea === selectedDepartment;
      const notTaken = !takenCourseIds.has(course.gold_id);
      return searchMatches && deptMatches && notTaken;
    });

    setFilteredCourses(filtered);
  }, [courses, searchQuery, selectedDepartment, studentSchedule]);

  const [filteredCourses, setFilteredCourses] = useState<Course[]>([]);

  const departments = [...new Set(courses.map((course) => course.subjectArea))];
  const termsOptions: Term[] = ["Fall", "Winter", "Spring", "Summer"];

  const handleTermChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setIsLoading(true);
    const newTerm = e.target.value as Term;
    setSelectedTerm(newTerm);
  };

  return (
    <div className="h-full w-full flex flex-col rounded-xl overflow-hidden relative">
      <div className="flex-none bg-[var(--off-white)] px-2 pt-2 pb-4">
        <h2 className="text-xl font-semibold mb-4">Course Catalog</h2>

        <input
          type="text"
          placeholder="Search courses..."
          className="w-full text-sm p-2 mb-4 border border-gray-300 rounded-xl"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
        />
        <div className="flex flex-col gap-2 w-full">
          <div className="flex items-center border border-gray-300 rounded-lg overflow-hidden w-full">
            <label htmlFor="department-select" className="bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 w-1/2">
              Department
            </label>
            <select
              id="department-select"
              className="p-2 border-0 focus:ring-0 focus:outline-none w-1/2"
              value={selectedDepartment}
              onChange={(e) => setSelectedDepartment(e.target.value)}
            >
              <option value="">All</option>
              {departments.map((dept) => (
                <option key={dept} value={dept}>
                  {dept}
                </option>
              ))}
            </select>
          </div>

          <div className="flex items-center border border-gray-300 rounded-lg overflow-hidden w-full">
            <label htmlFor="term-select" className="bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 w-2/5">
              Quarter
            </label>
            <select
              id="term-select"
              className="p-2 border-0 focus:ring-0 focus:outline-none w-3/5"
              value={selectedTerm}
              onChange={handleTermChange}
            >
              {termsOptions.map((term) => (
                <option key={term} value={term}>
                  {term}
                </option>
              ))}
            </select>
          </div>
        </div>
      </div>

      <div className="flex-1 overflow-y-auto min-h-0 shadow-[inset_0_8px_6px_-6px_rgba(0,0,0,0.1)] relative">
        {isLoading ? (
          <div className="absolute inset-0 bg-white bg-opacity-70 flex items-center justify-center z-10">
            <div className="text-lg font-medium text-gray-600 animate-pulse flex items-center">
              <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              Loading courses...
            </div>
          </div>
        ) : (
          <div className="space-y-4 p-2 pt-4">
            {filteredCourses.map((course) => {
              const bgColorClass = course.generalEd.length === 0 ? "bg-[var(--pale-orange)]" : "bg-[var(--pale-pink)]";
              return (
                <div
                  key={course.gold_id}
                  className="p-4 border border-gray-300 rounded-xl bg-white flex flex-col gap-5 cursor-pointer"
                  draggable={true}
                  onDragStart={(e) => {
                    e.dataTransfer.setData("application/json", JSON.stringify(course));
                  }}
                  onClick={() => setSelectedCourse(course)}
                >
                  <div>
                    <h3 className="text-lg font-bold">{course.gold_id}</h3>
                    <p className="text-sm">{course.title}</p>
                  </div>
                  <div className="flex flex-wrap gap-2 justify-between items-center">
                    <p className="text-sm text-gray-500">{course.units} units</p>
                    <div className={`p-1.5 border border-[var(--pale-pink)] rounded-lg ${bgColorClass}`}>
                      <p className="text-xs text-gray-500">{course.generalEd.length === 0 ? "Core" : "Gen Ed"}</p>
                    </div>
                  </div>
                </div>
              );
            })}
            {filteredCourses.length === 0 && !isLoading && (
              <p className="text-sm text-gray-500">No courses found. <br/> Are they already in your schedule?</p>
            )}
          </div>
        )}
      </div>

      {selectedCourse && (
        <CoursePreview course={selectedCourse} onClose={() => setSelectedCourse(null)} />
      )}
    </div>
  );
}

interface CoursePreviewProps {
  course: Course;
  onClose: () => void;
}

const CoursePreview: React.FC<CoursePreviewProps> = ({ course, onClose }) => {
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center">
      <div className="absolute inset-0 bg-black opacity-50" onClick={onClose} />
      <div className="bg-white rounded-xl p-6 z-10 max-w-lg w-full shadow-lg">
        <button 
          className="float-right text-gray-700 hover:text-gray-900"
          onClick={onClose}
          aria-label="Close popup"
        >
          &times;
        </button>
        <h2 className="text-xl font-bold mb-2">{course.gold_id}</h2>
        <p className="text-l font-bold mb-3"> {course.title}</p>
        <p className="mb-1"><strong>Description:</strong> {course.description}</p>
        <p className="mb-1"><strong>Subject Area:</strong> {course.subjectArea}</p>
        <p className="mb-1"><strong>Units:</strong> {course.units}</p>
        <p className="mb-1">
          <strong>General Ed:</strong> {course.generalEd.length > 0 ? (
            <ul className="list-disc pl-5">
              {course.generalEd.map((ge, index) => (
                <li key={index}>{ge.geCode} ({ge.geCollege})</li>
              ))}
            </ul>
          ) : (
            'None'
          )}
        </p>
        <p className="mb-1">
          <strong>Prerequisites:</strong> {course.prerequisites.length ? course.prerequisites.join(', ') : 'None'}
        </p>
        <p className="mb-1">
          <strong>Unlocks:</strong> {course.unlocks.length ? course.unlocks.join(', ') : 'None'}
        </p>
      </div>
    </div>
  );
};
