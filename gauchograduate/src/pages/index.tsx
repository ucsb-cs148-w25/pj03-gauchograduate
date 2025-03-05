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
  const url = `/api/course/query?quarter=${quarter}`;
  
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
    prerequisites: course.prerequisites,
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
      prerequisites: course.prerequisites,
      unlocks: Array.isArray(course.unlocks) ? course.unlocks.map(String) : [],
      term: [],
      grade: null // Add default grade
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
  const [selectedTerm, setSelectedTerm] = useState<string>("Fall");
  const [studentSchedule, setStudentSchedule] = useState<ScheduleType>({
    "Year 1": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 2": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 3": { Fall: [], Winter: [], Spring: [], Summer: [] },
    "Year 4": { Fall: [], Winter: [], Spring: [], Summer: [] },
  });
  const [selectedYear, setSelectedYear] = useState<YearType>("Year 1");
  const [saveStatus, setSaveStatus] = useState<'idle' | 'saving' | 'saved'>('idle');
  const [isCatalogCollapsed, setIsCatalogCollapsed] = useState<boolean>(false);
  const [isTrackerCollapsed, setIsTrackerCollapsed] = useState<boolean>(false);
  
  const [hasEverLoaded, setHasEverLoaded] = useState(false);

  const { 
    data: userCoursesData,
    isLoading: isUserCoursesLoading,
    isError: isUserCoursesError
  } = useQuery({
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
    initialData: undefined,
    refetchOnMount: true,
    refetchOnWindowFocus: false,
  });

  const { 
    data: savedSchedule, 
    isLoading: isSavedScheduleLoading,
    isError: isSavedScheduleError  
  } = useQuery({
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
      
      userCoursesData.courses.forEach((savedCourse: { id: number, quarter: string, grade?: string }) => {
        const course = allCourses.find(c => c.id === savedCourse.id);
        if (!course) return;
        
        const position = getYearAndTerm(savedCourse.quarter, userCoursesData.firstQuarter);
        if (!position) return;
        
        // Include the grade from the saved course data
        const courseWithGrade = {
          ...course,
          grade: savedCourse.grade || null
        };
        
        newSchedule[position.year][position.term].push(courseWithGrade);
      });

      return newSchedule;
    },
    enabled: !!userCoursesData,
    staleTime: 5 * 60 * 1000,
    gcTime: 30 * 60 * 1000,
    initialData: undefined,
    refetchOnMount: true,
    refetchOnWindowFocus: false,
  });

  useEffect(() => {
    if (savedSchedule) {
      setStudentSchedule(savedSchedule);
      setHasEverLoaded(true);
    }
  }, [savedSchedule]);

  useEffect(() => {
    if (status === "unauthenticated") {
      router.push("/signin");
    } else if (status === "authenticated" && session?.user) {
      // Check if user has a major selected
      if (!session.user.majorId) {
        router.push("/update-profile");
      }
    }
  }, [status, router, session]);

  const isLoading = isUserCoursesLoading || isSavedScheduleLoading || (!hasEverLoaded && !isUserCoursesError && !isSavedScheduleError);

  const { data: courses = [] } = useQuery({
    queryKey: ['courses', termToQuarter[selectedTerm as Term]],
    queryFn: () => fetchCourses(termToQuarter[selectedTerm as Term]),
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

  const updateCourseGrade = (year: YearType, term: Term, courseId: string, grade: string | null) => {
    setStudentSchedule((prevSchedule) => ({
      ...prevSchedule,
      [year]: {
        ...prevSchedule[year],
        [term]: prevSchedule[year][term].map(course => 
          course.gold_id === courseId 
            ? { ...course, grade: grade }
            : course
        )
      }
    }));
  };

  // Calculate the width classes based on collapse state
  const catalogWidthClass = isCatalogCollapsed ? "w-12" : "w-full md:w-1/5";
  const planWidthClass = `w-full ${isCatalogCollapsed && isTrackerCollapsed ? "md:w-full" : isCatalogCollapsed || isTrackerCollapsed ? "md:w-4/5" : "md:w-3/5"}`;
  const trackerWidthClass = isTrackerCollapsed ? "w-12" : "w-full md:w-1/5";

  return (
    <div className="h-screen flex flex-col">
      <Navbar />
      <div className="flex flex-1 flex-col md:flex-row overflow-hidden">
        <div className={`${catalogWidthClass} bg-[var(--off-white)] overflow-y-scroll transition-all duration-300 relative group`}>
          {isCatalogCollapsed ? (
            <button 
              onClick={() => setIsCatalogCollapsed(false)}
              className="w-full h-full flex flex-col items-center justify-center"
              aria-label="Expand course catalog"
            >
              <div className="absolute top-4 right-0 z-10 h-auto py-3 w-12 bg-white border-l border-t border-b border-gray-300 rounded-l-md flex flex-col items-center justify-center shadow-sm">
                <svg 
                  xmlns="http://www.w3.org/2000/svg" 
                  className="h-4 w-4 mb-2" 
                  fill="none" 
                  viewBox="0 0 24 24" 
                  stroke="currentColor"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                </svg>
                <span className="text-xs writing-mode-vertical">Catalog</span>
              </div>
            </button>
          ) : (
            <>
              <button 
                onClick={() => setIsCatalogCollapsed(true)}
                className="absolute top-4 right-0 z-10 h-8 w-6 bg-white border-l border-t border-b border-gray-300 rounded-l-md flex items-center justify-center shadow-sm hover:bg-gray-50"
                aria-label="Collapse course catalog"
                style={{ right: '-6px' }}
              >
                <svg 
                  xmlns="http://www.w3.org/2000/svg" 
                  className="h-4 w-4" 
                  fill="none" 
                  viewBox="0 0 24 24" 
                  stroke="currentColor"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
                </svg>
              </button>
              <div className="p-4">
                <CourseCatalog
                  courses={courses}
                  selectedTerm={selectedTerm}
                  setSelectedTerm={setSelectedTerm}
                  studentSchedule={studentSchedule}
                />
              </div>
            </>
          )}
        </div>
        
        <div className={`${planWidthClass} bg-white p-4 rounded-md shadow overflow-y-scroll transition-all duration-300`}>
          <FourYearPlan
            selectedYear={selectedYear}
            setSelectedYear={setSelectedYear}
            studentSchedule={studentSchedule}
            addCourse={addCourse}
            removeCourse={removeCourse}
            reorderCourse={reorderCourse}
            updateCourseGrade={updateCourseGrade}
            isDataLoading={isLoading}
            saveStatus={saveStatus}
            setSaveStatus={setSaveStatus}
            showSummerByDefault={isCatalogCollapsed || isTrackerCollapsed}
          />
        </div>
        
        <div className={`${trackerWidthClass} bg-[var(--off-white)] overflow-y-scroll transition-all duration-300 relative group`}>
          {isTrackerCollapsed ? (
            <button 
              onClick={() => setIsTrackerCollapsed(false)}
              className="w-full h-full flex flex-col items-center justify-center"
              aria-label="Expand progress tracker"
            >
              <div className="absolute top-4 left-0 z-10 h-auto py-3 w-12 bg-white border-r border-t border-b border-gray-300 rounded-r-md flex flex-col items-center justify-center shadow-sm">
                <svg 
                  xmlns="http://www.w3.org/2000/svg" 
                  className="h-4 w-4 mb-2" 
                  fill="none" 
                  viewBox="0 0 24 24" 
                  stroke="currentColor"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
                <span className="text-xs writing-mode-vertical">Progress</span>
              </div>
            </button>
          ) : (
            <>
              <button 
                onClick={() => setIsTrackerCollapsed(true)}
                className="absolute top-4 left-0 z-10 h-8 w-6 bg-white border-r border-t border-b border-gray-300 rounded-r-md flex items-center justify-center shadow-sm hover:bg-gray-50"
                aria-label="Collapse progress tracker"
                style={{ left: '-6px' }}
              >
                <svg 
                  xmlns="http://www.w3.org/2000/svg" 
                  className="h-4 w-4" 
                  fill="none" 
                  viewBox="0 0 24 24" 
                  stroke="currentColor"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                </svg>
              </button>
              <div className="p-4">
                <ProgressTracker
                  studentSchedule={studentSchedule}
                  college={majorData?.major?.college}
                  saveStatus={saveStatus}
                  setSaveStatus={setSaveStatus}
                />
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
