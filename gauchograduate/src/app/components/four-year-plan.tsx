'use client';

import React, { useState } from 'react';

export default function FourYearPlan({ selectedYear, setSelectedYear, studentSchedule }) { 


  const terms = ['Fall', 'Winter', 'Spring', 'Summer'];
  const yearLabels = ['Year 1', 'Year 2', 'Year 3', 'Year 4'];

  return (
    <div className="h-full w-full p-4 bg-white rounded-lg shadow-lg flex flex-col">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-2xl font-bold">Four-Year Plan</h2>
        {/* Year Selector */}
        <select 
        className="p-2 border border-gray-300 rounded-lg" 
        value={selectedYear}
        onChange={(e) => setSelectedYear(e.target.value)}
        >
          {yearLabels.map((year, index) => (
            <option key={index} value={year}>
              {year}
            </option>
          ))}
        </select>
      </div>

      {/* Plan Table */}
      <div className="grid grid-cols-4 gap-1 flex-grow">
        {terms.map((term) => (
          <div
            key={term}
            className="flex flex-col justify-start p-4 border border-gray-300 rounded-lg bg-[var(--off-white)]"
          >
            <h3 className="text-lg font-semibold text-center mb-4">{term}</h3>
            <div className="flex flex-col gap-4">
              {/* Example Course Cards */}
              {studentSchedule[selectedYear][term].length > 0 ? (
                studentSchedule[selectedYear][term].map((course) => (
                  <div key={course.course_id} className="p-4 bg-[var(--pale-orange)] rounded-lg">
                    <p className="font-bold text-sm">{course.course_id}</p>
                    <p className="text-xs">{course.title}</p>
                    <p className="text-xs text-gray-500">{course.units} credits</p>
                  </div>
                ))
              ) : (
                <p className="text-xs text-gray-500 text-center">No courses</p>
              )}
            </div>
            {term === 'Summer' && (
              <div className="mt-4 p-4 border-dashed border-2 border-gray-300 rounded-lg text-center text-sm text-gray-400">
                Drop Course Here
              </div>
            )}
          </div>
        ))}
      </div>
      <div className="mt-6 text-right">
        <p className="font-semibold">
          Total credits: <span className="font-normal">12</span>
        </p>
      </div>
    </div>
  );
}
