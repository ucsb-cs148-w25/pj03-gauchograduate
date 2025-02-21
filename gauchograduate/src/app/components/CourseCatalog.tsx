'use client';

import React, { useState } from 'react';
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

    const departments = [...new Set(courses.map((course) => course.subjectArea))];
    const termsOptions: Term[] = ["Fall", "Winter", "Spring", "Summer"];

    const takenCourseIds = new Set(
        Object.values(studentSchedule)
            .flatMap(yearSchedule => 
                Object.values(yearSchedule)
                    .flat()
                    .map(course => course.gold_id)
            )
    );

    const filteredCourses = courses.filter(course => {
        const searchMatches = course.title.toLowerCase().includes(searchQuery.toLowerCase()) || course.gold_id.toLowerCase().includes(searchQuery.toLowerCase());
        const deptMatches = selectedDepartment === '' || course.subjectArea === selectedDepartment;
        const notTaken = !takenCourseIds.has(course.gold_id);
        return searchMatches && deptMatches && notTaken;
    });

    return (
        <div className="h-full w-full flex flex-col rounded-xl overflow-hidden">
            <div className="flex-none bg-[var(--off-white)] px-2 pt-2 pb-4">
                <h2 className="text-xl font-semibold mb-4">Course Catalog</h2>

                <input
                    type="text"
                    placeholder="Search courses..."
                    className="w-full text-sm p-2 mb-4 border border-gray-300 rounded-xl"
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                />
                <div className="flex flex-wrap items-left gap-x-2 gap-y-2">
                    <select
                        className="p-2 border border-gray-300 rounded-lg"
                        value={selectedDepartment}
                        onChange={(e) => setSelectedDepartment(e.target.value)}
                    >
                        <option value="">Dept</option>
                        {departments.map((dept) => (
                            <option key={dept} value={dept}>
                                {dept}
                            </option>
                        ))}
                    </select>

                    <select
                        className="p-2 border border-gray-300 rounded-lg"
                        value={selectedTerm}
                        onChange={(e) => setSelectedTerm(e.target.value as Term)}
                    >
                        <option value="">TERM</option>
                        {termsOptions.map((term) => (
                            <option key={term} value={term}>
                                {term}
                            </option>
                        ))}
                    </select>
                </div>
            </div>

            <div className="flex-1 overflow-y-auto min-h-0 shadow-[inset_0_8px_6px_-6px_rgba(0,0,0,0.1)]">
                <div className="space-y-4 p-2 pt-4">
                    {filteredCourses.map((course) => {
                        const bgColorClass = course.generalEd.length === 0 ? "bg-[var(--pale-orange)]" : "bg-[var(--pale-pink)]";
                        return (
                            <div
                                key={course.gold_id}
                                className="p-4 border border-gray-300 rounded-xl bg-white flex flex-col gap-5"
                                draggable={true}
                                onDragStart={(e) => {
                                    e.dataTransfer.setData("application/json", JSON.stringify(course));
                                }}
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
                    {filteredCourses.length === 0 && (
                        <p className="text-sm text-gray-500">No courses found.</p>
                    )}
                </div>
            </div>
        </div>
    );
}
