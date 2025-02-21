'use client';

import { useSession } from "next-auth/react";
import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import CourseCatalog from "../app/components/CourseCatalog";
import FourYearPlan from "../app/components/four-year-plan";
import Navbar from "../app/components/Navbar";
import ProgressTracker from "../app/components/ProgressTracker";
import { Course, CourseInfo, ScheduleType, YearType, Term } from "../app/components/coursetypes";
import { useQuery } from '@tanstack/react-query';

const termToQuarter: { [key in Term]: string } = {
  Fall: "20241",
  Winter: "20242",
  Spring: "20243",
  Summer: "20244",
};

async function fetchCourses(quarter: string): Promise<Course[]> {
  const response = await fetch(`/api/course/query?quarter=${quarter}`);
  if (!response.ok) {
    throw new Error(`Failed to fetch courses. Status: ${response.status}`);
  }
  const data = await response.json();

  if (!data || !data.courses || !Array.isArray(data.courses)) {
    console.error("Unexpected API structure", data);
    return [];
  }

  const formattedCourses: Course[] = data.courses.map((course: CourseInfo) => ({
    gold_id: course.gold_id,
    id: course.id,
    title: course.title,
    description: course.description,
    subjectArea: course.subject_area,
    department: course.subject_area,
    units: course.units || 0,
    generalEd: Array.isArray(course.general_ed) ? course.general_ed : [],
    prerequisites: Array.isArray(course.prerequisites) ? course.prerequisites.map(String) : [],
    unlocks: Array.isArray(course.unlocks) ? course.unlocks.map(String) : [],
    term: []
  }));

  return formattedCourses.sort((a, b) => a.gold_id.localeCompare(b.gold_id));
}

export default function HomePage() {
  const { data: session, status } = useSession();
  const router = useRouter();
  const [selectedTerm, setSelectedTerm] = useState<Term>("Fall");
  const [studentSchedule, setStudentSchedule] = useState<ScheduleType>({
    "Year 1": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 2": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 3": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 4": { Fall: [], Winter: [], Spring: [], Summer: [] },
  });
  const [selectedYear, setSelectedYear] = useState<YearType>("Year 1");

  // Function to convert quarter code to year and term
  const getYearAndTerm = (quarterCode: string, firstQuarter: string): { year: YearType, term: Term } | null => {
    const year = parseInt(quarterCode.substring(0, 4));
    const quarter = quarterCode.substring(4);
    const firstYear = parseInt(firstQuarter.substring(0, 4));

    // Calculate which year in the plan (1-4)
    const yearDiff = year - firstYear + 1;

    const yearMap: { [key: number]: YearType } = {
      1: "Year 1",
      2: "Year 2",
      3: "Year 3",
      4: "Year 4"
    };

    const termMap: { [key: string]: Term } = {
      "1": "Fall",
      "2": "Winter",
      "3": "Spring",
      "4": "Summer"
    };

    return {
      year: yearMap[yearDiff],
      term: termMap[quarter]
    };
  };

  // Load saved schedule when user logs in
  useEffect(() => {
    async function loadSavedSchedule() {
      if (!session?.user?.courses) return;

      const userCourses = session.user.courses as { courses: { id: number, quarter: string }[], firstQuarter: string };
      if (!userCourses.courses || !userCourses.firstQuarter) return;

      const newSchedule: ScheduleType = {
        "Year 1": { Fall: [], Winter: [], Spring: [], Summer: [] },
        "Year 2": { Fall: [], Winter: [], Spring: [], Summer: [] },
        "Year 3": { Fall: [], Winter: [], Spring: [], Summer: [] },
        "Year 4": { Fall: [], Winter: [], Spring: [], Summer: [] },
      };

      // Load each course and place it in the correct position
      for (const savedCourse of userCourses.courses) {
        try {
          // Fetch course details
          const response = await fetch(`/api/course/${savedCourse.id}`);
          if (!response.ok) continue;

          const { course } = await response.json();
          if (!course) continue;

          // Calculate which year and term this course belongs in
          const position = getYearAndTerm(savedCourse.quarter, userCourses.firstQuarter);
          if (!position) continue;

          // Format the course data
          const formattedCourse: Course = {
            gold_id: course.gold_id,
            id: course.id,
            title: course.title,
            description: course.description,
            subjectArea: course.subject_area,
            units: course.units || 0,
            generalEd: Array.isArray(course.general_ed) ? course.general_ed : [],
            prerequisites: Array.isArray(course.prerequisites) ? course.prerequisites.map(String) : [],
            unlocks: Array.isArray(course.unlocks) ? course.unlocks.map(String) : [],
            term: []
          };

          // Add course to the schedule
          newSchedule[position.year][position.term].push(formattedCourse);
        } catch (error) {
          console.error('Error loading course:', error);
        }
      }

      setStudentSchedule(newSchedule);
    }

    loadSavedSchedule();
  }, [session]);

  const { data: courses = [] } = useQuery({
    queryKey: ['courses', termToQuarter[selectedTerm]],
    queryFn: () => fetchCourses(termToQuarter[selectedTerm]),
    staleTime: 5 * 60 * 1000,
    gcTime: 30 * 60 * 1000,
  });

  const { data: majorData } = useQuery({
    queryKey: ['major'],
    queryFn: async () => {
      const response = await fetch('/api/user/major');
      if (!response.ok) {
        throw new Error('Failed to fetch major');
      }
      return response.json();
    },
  });

  useEffect(() => {
    if (status === "unauthenticated") {
      router.push("/signin");
    }
  }, [status, router]);

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

  const reorderCourse = (year: YearType, term: Term, newCourses: Course[]) => {
    setStudentSchedule((prevSchedule) => ({
      ...prevSchedule,
      [year]: {
        ...prevSchedule[year],
        [term]: newCourses
      }
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
            studentSchedule={studentSchedule}
          />
        </div>
        <div className="w-full md:w-3/5 bg-white p-4 rounded-md shadow overflow-y-scroll">
          <FourYearPlan
            selectedYear={selectedYear}
            setSelectedYear={setSelectedYear}
            studentSchedule={studentSchedule}
            addCourse={addCourse}
            removeCourse={removeCourse}
            reorderCourse={reorderCourse}
          />
        </div>
        <div className="w-full md:w-1/5 bg-[var(--off-white)] p-4 overflow-y-scroll">
          <ProgressTracker
            studentSchedule={studentSchedule}
            courses={courses}
            college={majorData?.major?.college}
          />
        </div>
      </div>
    </div>
  );
}
