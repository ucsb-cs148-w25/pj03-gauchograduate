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
  Fall: "20244",
  Winter: "20241",
  Spring: "20242",
  Summer: "20243",
};

async function fetchCourses(quarter: string): Promise<Course[]> {
  const url = quarter ? `/api/course/query?quarter=${quarter}` : `/api/course/query?all=true`;
  
  const response = await fetch(url);
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

async function fetchCoursesByIds(courseIds: number[]): Promise<Course[]> {
  if (!courseIds.length) return [];
  
  try {
    const response = await fetch('/api/course/query/batch', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ courseIds }),
    });
    
    if (!response.ok) {
      throw new Error(`Failed to fetch courses. Status: ${response.status}`);
    }
    
    const data = await response.json();
    
    if (!data || !data.courses || !Array.isArray(data.courses)) {
      console.error("Unexpected API structure", data);
      return [];
    }
    
    return data.courses.map((course: CourseInfo) => ({
      gold_id: course.gold_id,
      id: course.id,
      title: course.title,
      description: course.description,
      subjectArea: course.subject_area,
      department: course.subject_area || course.subject_area,
      units: course.units || 0,
      generalEd: Array.isArray(course.general_ed) ? course.general_ed : [],
      prerequisites: Array.isArray(course.prerequisites) ? course.prerequisites.map(String) : [],
      unlocks: Array.isArray(course.unlocks) ? course.unlocks.map(String) : [],
      term: []
    }));
  } catch (error) {
    console.error('Error fetching courses by IDs:', error);
    return [];
  }
}

const getYearAndTerm = (quarterCode: string, firstQuarter: string): { year: YearType, term: Term } | null => {
  const year = parseInt(quarterCode.substring(0, 4));
  const quarter = quarterCode.substring(4);
  const firstYear = parseInt(firstQuarter.substring(0, 4));

  const yearDiff = year - firstYear + 1;

  const yearMap: { [key: number]: YearType } = {
    1: "Year 1",
    2: "Year 2",
    3: "Year 3",
    4: "Year 4"
  };

  const termMap: { [key: string]: Term } = {
    "1": "Winter",
    "2": "Spring",
    "3": "Summer",
    "4": "Fall"
  };

  return {
    year: yearMap[yearDiff],
    term: termMap[quarter]
  };
};

export default function HomePage() {
  const { data: session, status } = useSession();
  const router = useRouter();
  const [selectedTerm, setSelectedTerm] = useState<string>("");
  const [studentSchedule, setStudentSchedule] = useState<ScheduleType>({
    "Year 1": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 2": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 3": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 4": { Fall: [], Winter: [], Spring: [], Summer: [] },
  });
  const [selectedYear, setSelectedYear] = useState<YearType>("Year 1");

  const { data: userCoursesData } = useQuery({
    queryKey: ['userCourses', session?.user?.id],
    queryFn: async () => {
      if (!session?.user?.id) return null;
      const response = await fetch('/api/user/courses');
      if (!response.ok) {
        throw new Error('Failed to fetch user courses');
      }
      return response.json();
    },
    enabled: !!session?.user?.id,
    staleTime: 5 * 60 * 1000,
    gcTime: 30 * 60 * 1000,
  });

  const { data: savedSchedule } = useQuery({
    queryKey: ['savedSchedule', userCoursesData],
    queryFn: async () => {
      if (!userCoursesData || !userCoursesData.courses || !userCoursesData.firstQuarter) return null;

      const newSchedule: ScheduleType = {
        "Year 1": { Fall: [], Winter: [], Spring: [], Summer: [] },
        "Year 2": { Fall: [], Winter: [], Spring: [], Summer: [] },
        "Year 3": { Fall: [], Winter: [], Spring: [], Summer: [] },
        "Year 4": { Fall: [], Winter: [], Spring: [], Summer: [] },
      };

      const courseIds = userCoursesData.courses.map((savedCourse: { id: number }) => savedCourse.id);
      
      const allCourses = await fetchCoursesByIds(courseIds);
      
      userCoursesData.courses.forEach((savedCourse: { id: number, quarter: string }) => {
        const course = allCourses.find(c => c.id === savedCourse.id);
        if (!course) return;
        
        const position = getYearAndTerm(savedCourse.quarter, userCoursesData.firstQuarter);
        if (!position) return;
        
        newSchedule[position.year][position.term].push(course);
      });

      return newSchedule;
    },
    enabled: !!userCoursesData,
    staleTime: 5 * 60 * 1000,
    gcTime: 30 * 60 * 1000,
  });

  useEffect(() => {
    if (savedSchedule) {
      setStudentSchedule(savedSchedule);
    }
  }, [savedSchedule]);

  useEffect(() => {
    if (status === "unauthenticated") {
      router.push("/signin");
    }
  }, [status, router]);

  const { data: courses = [] } = useQuery({
    queryKey: ['courses', selectedTerm ? termToQuarter[selectedTerm as Term] : 'all'],
    queryFn: () => selectedTerm ? fetchCourses(termToQuarter[selectedTerm as Term]) : fetchCourses(''),
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
            college={majorData?.major?.college}
          />
        </div>
      </div>
    </div>
  );
}
