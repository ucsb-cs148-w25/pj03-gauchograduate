'use client';

import { useState, useEffect } from "react";
import CourseCatalog from "../app/components/CourseCatalog";
import FourYearPlan from "../app/components/four-year-plan";
import Navbar from "../app/components/Navbar";
import ProgressTracker from "../app/components/ProgressTracker";

import { Course, CourseInfo, ScheduleType, YearType, Term } from "../app/components/coursetypes";

const termToQuarter: { [key in Term]: string } = {
  Fall: "20241",
  Winter: "20242",
  Spring: "20243",
  Summer: "20244",
};

async function fetchAndSetCourses(quarter: string, setCourses: (courses: Course[]) => void) {
  try {
    const response = await fetch(`https://thingproxy.freeboard.io/fetch/https://gauchograduate.vercel.app/api/course/query?quarter=${quarter}`);

    if (!response.ok) {
      throw new Error(`Failed to fetch courses. Status: ${response.status}`);
    }

    const data = await response.json();
    console.log(`API Response for quarter ${quarter}:`, data);

    if (!data || !data.courses || !Array.isArray(data.courses)) {
      console.error("Unexpected API structure", data);
      setCourses([]);
      return;
    }

    const formattedCourses: Course[] = data.courses
      .filter((course: CourseInfo) => course && course.gold_id)
      .map((course: CourseInfo) => ({
        gold_id: course.gold_id,
        id: course.id,
        title: course.title || '',
        description: course.description || '',
        subjectArea: course.subject_area || '',
        department: course.subject_area || '',
        units: course.units || 0,
        generalEd: Array.isArray(course.general_ed) ? course.general_ed : [],
        prerequisites: Array.isArray(course.prerequisites) ? course.prerequisites.map(String) : [],
        unlocks: Array.isArray(course.unlocks) ? course.unlocks.map(String) : [],
        term: []
      }));

    const sortedCourses = formattedCourses.length > 0 
      ? formattedCourses.sort((a, b) => (a.gold_id || '').localeCompare(b.gold_id || ''))
      : formattedCourses;

    sortedCourses.forEach(course => {
      console.log(`Course: ${course.gold_id} - ${course.title}`);
      
      if (Array.isArray(course.generalEd) && course.generalEd.length > 0) {
        const genEdValues = course.generalEd
          .map(ge => `${ge?.geCode || 'N/A'} (${(ge?.geCollege || '').trim()})`)
          .join(", ");
        console.log(`Gen Eds: ${genEdValues}`);
      } else {
        console.log("Gen Eds: None");
      }
    });

    setCourses(sortedCourses);
  } catch (error) {
    console.error("Error fetching courses:", error);
    setCourses([]);
  }
}

export default function TestPage() {
  const [courses, setCourses] = useState<Course[]>([]);
  const [selectedTerm, setSelectedTerm] = useState<Term>("Fall");

  useEffect(() => {
    console.log(`Fetching courses for selected term: ${selectedTerm}`);
    fetchAndSetCourses(termToQuarter[selectedTerm], setCourses);
  }, [selectedTerm]);

  const defaultSchedule: ScheduleType = {
    "Year 1": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 2": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 3": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 4": { Fall: [], Winter: [], Spring: [], Summer: [] },
  };

  const [studentSchedule, setStudentSchedule] = useState<ScheduleType>(defaultSchedule);
  const [selectedYear, setSelectedYear] = useState<YearType>("Year 1");

  const mockMajorData = {
    major: {
      id: 1,
      name: "Computer Science",
      college: "CoE",
      requirements: [1, 2, 3] // Mock requirement IDs
    }
  };

  const addCourse = (course: Course, term: Term) => {
    setStudentSchedule((prevSchedule) => ({
      ...prevSchedule,
      [selectedYear]: {
        ...prevSchedule[selectedYear],
        [term]: [...prevSchedule[selectedYear][term], course]
      }
    }));
  };

  const removeCourse = (course: Course, term: Term) => {
    setStudentSchedule((prevSchedule) => ({
      ...prevSchedule,
      [selectedYear]: {
        ...prevSchedule[selectedYear],
        [term]: prevSchedule[selectedYear][term].filter((c) => c.gold_id !== course.gold_id),
      },
    }));
  };

  return (
    <div className="h-screen flex flex-col">
      <Navbar />
      <div className="flex flex-1 flex-col md:flex-row overflow-hidden">
        <div className="w-full md:w-1/5 bg-[var(--off-white)] p-4 overflow-y-scroll">
          <CourseCatalog 
            courses={courses} 
            selectedTerm={selectedTerm} 
            setSelectedTerm={setSelectedTerm}
            studentSchedule={studentSchedule}  // Add this prop
          />
        </div>
        <div className="w-full md:w-3/5 bg-white p-4 rounded-md shadow overflow-y-scroll">
          <FourYearPlan
            selectedYear={selectedYear}
            setSelectedYear={setSelectedYear}
            studentSchedule={studentSchedule}
            addCourse={addCourse}
            removeCourse={removeCourse}
          />
        </div>
        <div className="w-full md:w-1/5 bg-[var(--off-white)] p-4 overflow-y-scroll">
          <ProgressTracker 
            studentSchedule={studentSchedule} 
            courses={courses} 
            college={mockMajorData.major.college} 
          />
        </div>
      </div>
    </div>
  );
}
