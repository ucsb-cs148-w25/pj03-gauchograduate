"use client";

import React, { useState, useEffect } from "react";
import { Course, Term, ScheduleType } from "./coursetypes";
import CoursePreview from "./CoursePreview";

interface CourseCatalogProps {
  courses: Course[];
  selectedTerm: string;
  setSelectedTerm: (term: Term) => void;
  studentSchedule: ScheduleType;
  saveStatus?: 'idle' | 'saving' | 'saved';
  searchQuery?: string;
  setSearchQuery?: (query: string) => void;
  selectedDepartment?: string;
  setSelectedDepartment?: (department: string) => void;
}

export default function CourseCatalog({
  courses,
  selectedTerm,
  setSelectedTerm,
  studentSchedule,
  saveStatus,
  searchQuery: externalSearchQuery,
  setSearchQuery: externalSetSearchQuery,
  selectedDepartment: externalSelectedDepartment,
  setSelectedDepartment: externalSetSelectedDepartment,
}: CourseCatalogProps) {
  const [localSearchQuery, setLocalSearchQuery] = useState("");
  const [localSelectedDepartment, setLocalSelectedDepartment] = useState("");
  
  const searchQuery = externalSearchQuery !== undefined ? externalSearchQuery : localSearchQuery;
  const setSearchQuery = externalSetSearchQuery || setLocalSearchQuery;
  const selectedDepartment = externalSelectedDepartment !== undefined ? externalSelectedDepartment : localSelectedDepartment;
  const setSelectedDepartment = externalSetSelectedDepartment || setLocalSelectedDepartment;
  
  const [selectedCourse, setSelectedCourse] = useState<Course | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [filteredCourses, setFilteredCourses] = useState<Course[]>([]);

  useEffect(() => {
    if (courses.length > 0) {
      setIsLoading(false);
    }
  }, [courses]);

  useEffect(() => {
    const takenCourseIds = new Set(
      Object.values(studentSchedule).flatMap((yearSchedule) =>
        Object.values(yearSchedule).flat().map((course) => course.gold_id)
      )
    );

    const filtered = courses.filter((course) => {
      const searchMatches =
        course.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        course.gold_id.toLowerCase().includes(searchQuery.toLowerCase());
      const deptMatches =
        selectedDepartment === "" || course.subjectArea === selectedDepartment;
      const notTaken = !takenCourseIds.has(course.gold_id);
      return searchMatches && deptMatches && notTaken;
    });

    setFilteredCourses(filtered);
  }, [courses, searchQuery, selectedDepartment, studentSchedule]);

  const departments = [...new Set(courses.map((course) => course.subjectArea))];
  const termsOptions: Term[] = ["Fall", "Winter", "Spring", "Summer"];

  const handleTermChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setIsLoading(true);
    const newTerm = e.target.value as Term;
    setSelectedTerm(newTerm);
  };

  return (
    <div className="h-full w-full flex flex-col rounded-xl overflow-hidden relative">
      <div className="sticky top-0 z-10 bg-[var(--off-white)] px-2 pt-2 pb-4">
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
            <label
              htmlFor="department-select"
              className="bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 w-1/2"
            >
              Department
            </label>
            <select
              id="department-select"
              className="p-2 border-0 focus:ring-0 focus:outline-none w-full sm:w-1/2"
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
            <label
              htmlFor="term-select"
              className="bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 w-2/5"
            >
              Quarter
            </label>
            <select
              id="term-select"
              className="p-2 border-0 focus:ring-0 focus:outline-none w-full sm:w-3/5"
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
        {isLoading && (
          <div className="absolute inset-0 bg-white bg-opacity-70 flex items-center justify-center z-50">
            <div className="text-lg font-medium text-gray-600 animate-pulse flex items-center">
              <svg
                className="animate-spin -ml-1 mr-3 h-5 w-5 text-gray-600"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
              >
                <circle
                  className="opacity-25"
                  cx="12"
                  cy="12"
                  r="10"
                  stroke="currentColor"
                  strokeWidth="4"
                />
                <path
                  className="opacity-75"
                  fill="currentColor"
                  d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                />
              </svg>
              Loading courses...
            </div>
          </div>
        )}
        <div className="space-y-4 p-2 pt-4">
          {filteredCourses.map((course) => {
            const bgColorClass =
              course.generalEd.length === 0
                ? "bg-[var(--pale-orange)]"
                : "bg-[var(--pale-pink)]";
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
                  <div
                    className={`p-1.5 border border-[var(--pale-pink)] rounded-lg ${bgColorClass}`}
                  >
                    <p className="text-xs text-gray-500">
                      {course.generalEd.length === 0 ? "Core" : "Gen Ed"}
                    </p>
                  </div>
                </div>
              </div>
            );
          })}
          {filteredCourses.length === 0 && !isLoading && (
            <p className="text-sm text-gray-500">
              No courses found. <br /> Are they already in your schedule?
            </p>
          )}
        </div>
      </div>

      {selectedCourse && (
        <CoursePreview 
          course={selectedCourse} 
          onClose={() => setSelectedCourse(null)} 
          studentSchedule={studentSchedule}
          saveStatus={saveStatus}
        />
      )}
    </div>
  );
}
