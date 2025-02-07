'use client';


import React, { useState } from 'react';


import { Course, Term } from "./coursetypes";


interface CourseCatalogProps {
    courses: Course[];
    selectedTerm: string;
    setSelectedTerm: (term: Term) => void;
}


export default function CourseCatalog({ courses, selectedTerm, setSelectedTerm }: CourseCatalogProps) {


    const [searchQuery, setSearchQuery] = useState('');
    const [selectedDepartment, setSelectedDepartment] = useState('');


    const departments = [...new Set(courses.map((course) => course.department))];
    const termsOptions: Term[] = ["Fall", "Winter", "Spring", "Summer"];


    // filters courses by title using searchQuery
    // if the user doesn't input one, searchQuery is '' which returns all the courses
    const filteredCourses = courses.filter(course => {
        const searchMatches = course.title.toLowerCase().includes(searchQuery.toLowerCase());
        const deptMatches = selectedDepartment === '' || course.department === selectedDepartment;
        return searchMatches && deptMatches;
    }
    );


    return (
        <div className="h-full w-full flex flex-col">
            <h2 className="text-xl font-semibold mb-4">Course Catalog</h2>


            {/* Search Bar */}
            {/* once the user types a search query it automatically filters*/}
            <input
                type="text"
                placeholder="Search courses..."
                className="w-full text-sm p-2 mb-4 border border-gray-300 rounded-xl"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
            />
            <div className="flex flex-wrap items-center gap-x-2 gap-y-0 mb-2">
                {/* Department Selector */}
                <select
                    className="p-2 border border-gray-300 rounded-lg mb-4"
                    value={selectedDepartment}
                    onChange={(e) => setSelectedDepartment(e.target.value)}
                >
                    <option value="">Department</option>
                    {departments.map((dept) => (
                        <option key={dept} value={dept}>
                            {dept}
                        </option>
                    ))}
                </select>


                {/* Term Selector */}
                <select
                    className="p-2 border border-gray-300 rounded-lg mb-4"
                    value={selectedTerm}
                    onChange={(e) => setSelectedTerm(e.target.value as Term)}
                >
                    <option value="">Term</option>
                    {termsOptions.map((term) => (
                        <option key={term} value={term}>
                            {term}
                        </option>
                    ))}
                </select>
            </div>
            {/* Course Cards */}
            <div className="space-y-4">
                {/* uses filtered courses from the search query */}
                {filteredCourses.map((course) => {
                    const bgColorClass = course.generalEd.length === 0 ? "bg-[var(--pale-orange)]" : "bg-[var(--pale-pink)]";
                    return (
                        <div
                            key={course.course_id}
                            className="p-4 border border-gray-300 rounded-xl bg-white flex flex-col gap-5"
                            draggable={true}
                            onDragStart={(e) => {
                                // using this link: https://developer.mozilla.org/en-US/docs/Web/API/DataTransfer
                                // basically converts to JSON string to compare in four-year-plan
                                e.dataTransfer.setData("application/json", JSON.stringify(course));
                            }}
                        >
                            <div>
                                <h3 className="text-lg font-bold">{course.course_id}</h3>
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
                {/* equivalent to an if then statement*/}
                {filteredCourses.length === 0 && (
                    <p className="text-sm text-gray-500">No courses found.</p>
                )}
            </div>
        </div>
    );
}


