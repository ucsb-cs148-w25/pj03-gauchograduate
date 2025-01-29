'use client';

import { useState } from "react";
import CourseCatalog from "../app/components/CourseCatalog";
import FourYearPlan from "../app/components/four-year-plan";
import Navbar from "../app/components/Navbar";

export default function TestPage() {

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

    const defaultSchedule = {
        "Year 1": { Fall: [courses[0]], Winter: [], Spring: [courses[1]], Summer: [] },
        "Year 2": { Fall: [], Winter: [courses[2]], Spring: [], Summer: [] },
        "Year 3": { Fall: [], Winter: [], Spring: [], Summer: [courses[0]] },
        "Year 4": { Fall: [], Winter: [], Spring: [courses[0]], Summer: [] },
    };

    const [studentSchedule, setStudentSchedule] = useState(defaultSchedule);
    const [selectedYear, setSelectedYear] = useState("Year 1");

    const addCourse = (course, term) => {
        setStudentSchedule((prevSchedule) => ({
            ...prevSchedule,
            [selectedYear]: {
              ...prevSchedule[selectedYear],
              [term]: [...prevSchedule[selectedYear][term], course]
            }
        }));
    };

    return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <div className="flex flex-1">
        {/* Course Catalog */}
        <CourseCatalog courses={courses}/>

        {/* 4-year calendar */}
        <div className="w-2/4 bg-white p-4 rounded-md shadow">
          <FourYearPlan 
          selectedYear={selectedYear} 
          setSelectedYear={setSelectedYear} 
          studentSchedule={studentSchedule} 
          addCourse={addCourse}
          />
        </div>

        {/* Graduation Progress */}
        <div className="w-1/4 bg-[var(--off-white)] p-4">
          <h2 className="text-xl font-semibold">Progress Tracker</h2>
        </div>
      </div>
    </div>
  );
}
