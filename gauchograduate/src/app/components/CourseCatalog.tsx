'use client';

import React, { useState } from 'react';

export default function CourseCatalog() {

    const [searchQuery, setSearchQuery] = useState('');
    const [selectedDepartment, setSelectedDepartment] = useState('');
    const [selectedTerm, setSelectedTerm] = useState('');

    // a couple testing courses for now, need other members to facilitate back-end logic
    const courses = [
        {
            course_id: "CMPSC 16",
            title: "Problem Solving with Computers I",
            description: "Fundamental building blocks for solving problems using computers. Topics include basic computer organization and programming constructs: memory CPU, binary arithmetic, variables, expressions, statements, conditionals, iteration, functions, parameters, recursion, primitive and composite data types, and basic operating system and debugging tools.",
            subjectArea: "Computer Science",
            units: 4,
            generalEd: "Core",
            prerequisites: [],
            unlocks: ["CMPSC 24"],
            department: "CMPSC",
            term: ["Fall", "Winter"]
        },
        {
            course_id: "ASAM 1",
            title: "Introduction to Asian American History, 1850-Present",
            description: "Historical survey of Asian Americans in the United States from 1850 to the present. Topics include: Immigration patterns, settlement and employment, race and gender relations, community development, and transnational connections.",
            subjectArea: "Asian American Studies",
            units: 4,
            generalEd: "Gen Ed",
            prerequisites: [],
            unlocks: [],
            department: "ASAM",
            term: ["Spring"],
        },
        {
            course_id: "CMPSC 24",
            title: "Problem Solving with Computers II",
            description: "Intermediate building blocks for solving problems using computers. Topics include intermediate object-oriented programming, data structures, object-oriented design, algorithms for manipulating these data structures, and their run-time analyses. Data structures introduced include stacks, queues, lists, trees, and sets.",
            subjectArea: "Computer Science",
            units: 4,
            generalEd: "Core",
            prerequisites: ["CMPSC 16 (grade C or better)", "Mathematics 3B or 2B (grade C or better, may be taken concurrently)"],
            unlocks: [],
            department: "CMPSC",
            term: ["Winter", "Spring"]
        } 
    ];

    const departments = [...new Set(courses.map((course) => course.department))];
    const terms = [...new Set(courses.flatMap((course) => course.term))];

    // filters courses by title using searchQuery
    // if the user doesn't input one, searchQuery is '' which returns all the courses
    const filteredCourses = courses.filter(course =>
    {
        const searchMatches = course.title.toLowerCase().includes(searchQuery.toLowerCase());
        const deptMatches = selectedDepartment === '' || course.department === selectedDepartment;
        const termMatches = selectedTerm === '' || course.term.includes(selectedTerm);
        return searchMatches && deptMatches && termMatches;
    }
    );

    return (
        <div className="w-1/4 bg-[var(--off-white)] p-4">
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
        <div className = "flex flex-row space-x-2">
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
            onChange={(e) => setSelectedTerm(e.target.value)}
            >
            <option value="">Term</option>
            {terms.map((term) => (
                <option key={term} value={term}>
                {term}
                </option>
            ))}
            </select>
        </div>
        
        
        {/* Course Cards */}
        <div className="space-y-4">
            {/* uses filtered courses from the search query */}
            {filteredCourses.map((course) => (
            <div
                key={course.course_id}
                className="p-4 border border-gray-300 rounded-xl bg-white flex flex-col gap-5"
            >
                <div>
                    <h3 className="text-lg font-bold">{course.course_id}</h3>
                    <p className="text-sm">{course.title}</p>
                </div>
                            
                <div className= "flex gap-10 justify-between items-center">
                    <p className="text-sm text-gray-500">{course.units} units</p>
                    <div className="p-1.5 border border-[var(--pale-pink)] rounded-lg bg-[var(--pale-pink)]">
                    <p className="text-xs text-gray-500">{course.generalEd}</p>
                    </div>
                </div>
            </div>
            ))}
            {/* equivalent to an if then statement*/}
            {filteredCourses.length === 0 && (
            <p className="text-sm text-gray-500">No courses found.</p>
            )}
        </div>
        </div>
    );
}
