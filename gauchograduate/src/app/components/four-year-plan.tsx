'use client';

import React, { useState } from 'react';
import DeleteIcon from '@mui/icons-material/Delete';
import { Terms, Years, Course, ScheduleType, YearType, Term } from "./coursetypes";

interface FourYearPlanProps {
  selectedYear: YearType;
  setSelectedYear: React.Dispatch<React.SetStateAction<YearType>>;
  studentSchedule: ScheduleType;
  addCourse: (course: Course, term: Term) => void;
  removeCourse: (course: Course, term: Term) => void;
}

export default function FourYearPlan({ selectedYear, setSelectedYear, studentSchedule, addCourse, removeCourse }: FourYearPlanProps) {
  // Helper function to calculate total credits for a term
  const calculateCredits = (term: Term): number => {
    return studentSchedule[selectedYear][term].reduce((total, course) => total + course.units, 0);
  };

  return (
    <div className="h-full w-full p-4 bg-white rounded-lg shadow-lg flex flex-col">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-2xl font-bold">Four-Year Plan</h2>
        {/* Year Selector */}
        <select
          className="p-2 border border-gray-300 rounded-lg"
          value={selectedYear}
          onChange={(e) => setSelectedYear(e.target.value as YearType)}
        >
          {Years.map((year, index) => (
            <option key={index} value={year}>
              {year}
            </option>
          ))}
        </select>
      </div>

      {/* Plan Table */}
      <div className="grid grid-cols-4 gap-1 flex-grow">
        {Terms.map((term) => (
          <div
            key={term}
            onDragOver={(e) => e.preventDefault()}
            onDrop={(e) => {
              e.preventDefault();
              const json = e.dataTransfer.getData("application/json");
              if (!json) return;
              const droppedCourse = JSON.parse(json);
              addCourse(droppedCourse, term as Term);
            }}
            className="flex flex-col justify-start p-4 border border-gray-300 rounded-lg bg-[var(--off-white)]"
          >
            <h3 className="text-lg font-semibold text-center mb-4">{term}</h3>
            <div className="flex flex-col gap-4">
              {/* Course cards */}
              {studentSchedule[selectedYear][term].length > 0 ? (
                studentSchedule[selectedYear][term].map((course) => (
                  <div
                    key={course.course_id}
                    className="relative p-4 bg-[var(--pale-orange)] rounded-lg group"
                  >
                    {/* course details */}
                    <p className="font-bold text-sm">{course.course_id}</p>
                    <p className="text-xs">{course.title}</p>
                    <p className="text-xs text-gray-500">{course.units} credits</p>

                    {/* hover to click on delete button */}
                    <button
                      className="bg-red-500 text-white p-1 rounded-full opacity-0 group-hover:opacity-100"
                      onClick={() => removeCourse(course, term)}
                    >
                      <DeleteIcon fontSize="small" />
                    </button>
                  </div>
                ))
              ) : (
                <p className="text-xs text-gray-500 text-center">No courses</p>
              )}
            </div>
            {/* Total credits for the term */}
            <div className="mt-4 text-center text-sm font-medium text-gray-600">
              Total credits: {calculateCredits(term)}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

