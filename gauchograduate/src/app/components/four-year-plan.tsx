import { useSession } from 'next-auth/react';
import { Terms, Years, Course, Term, FourYearPlanProps, YearType } from "./coursetypes";
import { useState, useEffect, useRef, useCallback } from 'react';
import { getAcademicYear, isQuarterInPast, isCurrentQuarter } from './utils/quarterUtils';
import CourseModal from './course-popup';

export default function FourYearPlan({
  selectedYear,
  setSelectedYear,
  studentSchedule,
  addCourse,
  removeCourse,
  reorderCourse,
  isDataLoading,
  updateCourseGrade,
  saveStatus,
  setSaveStatus
}: FourYearPlanProps) {
  const { data: session } = useSession();
  const firstQuarter = session?.user?.courses?.firstQuarter || '20224';
  const [showSummer, setShowSummer] = useState(false);
  const [selectedCourse, setSelectedCourse] = useState<{ course: Course, term: Term } | null>(null);
  const [isActive, setIsActive] = useState(false);
  const [poofingCourse, setPoofingCourse] = useState<{ id: string, x: number, y: number } | null>(null);
  const planRef = useRef<HTMLDivElement>(null);
  const gridRef = useRef<HTMLDivElement>(null);
  const [validDropTargets, setValidDropTargets] = useState<Set<HTMLElement>>(new Set());
  const [draggedOverTerm, setDraggedOverTerm] = useState<string | null>(null);
  const [isDraggingCourse, setIsDraggingCourse] = useState(false);

  useEffect(() => {
    if (saveStatus === 'saved') {
      setIsActive(true);
      const timer = setTimeout(() => {
        setIsActive(false);
      }, 5000);
      return () => clearTimeout(timer);
    }
  }, [saveStatus]);

  useEffect(() => {
    if (gridRef.current) {
      const termColumns = gridRef.current.querySelectorAll('[data-term-column]');
      const targets = new Set<HTMLElement>();
      termColumns.forEach(column => targets.add(column as HTMLElement));
      setValidDropTargets(targets);
    }
  }, [showSummer, selectedYear]);

  useEffect(() => {
    const handleDragStart = () => {
      setIsDraggingCourse(true);
    };

    const handleDragEnd = () => {
      setIsDraggingCourse(false);
      setDraggedOverTerm(null);
    };

    document.addEventListener('dragstart', handleDragStart);
    document.addEventListener('dragend', handleDragEnd);

    return () => {
      document.removeEventListener('dragstart', handleDragStart);
      document.removeEventListener('dragend', handleDragEnd);
    };
  }, []);

  const getQuarterCode = useCallback((year: YearType, term: Term): string => {
    const yearIndex = Years.indexOf(year);
    const baseYear = parseInt(firstQuarter.substring(0, 4));
    const yearNum = baseYear + yearIndex;
    const quarterSuffix = { Fall: "4", Winter: "1", Spring: "2", Summer: "3" }[term];
    return `${yearNum}${quarterSuffix}`;
  }, [firstQuarter]);

  const DBRemoveCourses = useCallback(async (courseID: number, term: Term) => {
    try {
      setSaveStatus('saving');
      const quarterCode = getQuarterCode(selectedYear, term);
      const response = await fetch("/api/user/remove-course", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: courseID, quarter: quarterCode }),
      });
      const data = await response.json();
      console.log("Removal Response:", data);
      setSaveStatus('saved');
    } catch (error) {
      console.error("Error removing courses:", error);
      setSaveStatus('idle');
    }
  }, [selectedYear, getQuarterCode, setSaveStatus]);

  useEffect(() => {
    const handleDocumentDragOver = (e: DragEvent) => { e.preventDefault(); };
    const handleDocumentDrop = (e: DragEvent) => {
      e.preventDefault();
      if (planRef.current && !planRef.current.contains(e.target as Node)) {
        const data = e.dataTransfer?.getData("application/json");
        if (data) {
          try {
            const courseData = JSON.parse(data);
            if (courseData.gold_id && courseData.originTerm) {
              setPoofingCourse({ id: courseData.gold_id, x: e.clientX, y: e.clientY });
              removeCourse(courseData, courseData.originTerm);
              DBRemoveCourses(courseData.id, courseData.originTerm);
              setTimeout(() => { setPoofingCourse(null); }, 500);
            }
          } catch (error) {
            console.error("Error parsing dragged course data:", error);
          }
        }
      }
    };
    document.addEventListener('dragover', handleDocumentDragOver);
    document.addEventListener('drop', handleDocumentDrop);
    return () => {
      document.removeEventListener('dragover', handleDocumentDragOver);
      document.removeEventListener('drop', handleDocumentDrop);
    };
  }, [removeCourse, DBRemoveCourses]);

  const getYearDisplay = (year: YearType): string => {
    const yearIndex = Years.indexOf(year);
    return getAcademicYear(firstQuarter, yearIndex);
  };


  const DBAddCourses = useCallback(async (courseID: number, term: Term) => {
    try {
      setSaveStatus('saving');
      const quarterCode = getQuarterCode(selectedYear, term);
      const response = await fetch("/api/user/add-course", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: courseID, quarter: quarterCode }),
      });
      const data = await response.json();
      console.log("Add Response:", data);
      setSaveStatus('saved');
    } catch (error) {
      console.error("Error adding courses:", error);
      setSaveStatus('idle');
    }
  }, [selectedYear, getQuarterCode, setSaveStatus]);

  const DBUpdateGrade = useCallback(async (courseID: number, term: Term, grade: string | null) => {
    try {
      setSaveStatus('saving');
      const quarterCode = getQuarterCode(selectedYear, term);
      const response = await fetch("/api/user/courses/set-grade", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: courseID, quarter: quarterCode, grade }),
      });
      const data = await response.json();
      console.log("Grade Update Response:", data);
      setSaveStatus('saved');
      return true;
    } catch (error) {
      console.error("Error updating grade:", error);
      setSaveStatus('idle');
      return false;
    }
  }, [selectedYear, getQuarterCode, setSaveStatus]);

  const DBMoveCourse = useCallback(async (courseID: number, originTerm: Term, term: Term) => {
    setSaveStatus('saving');

    // Find the course in the original term to get its grade if it exists
    const course = studentSchedule[selectedYear][originTerm].find(c => c.id === courseID);
    const grade = course?.grade || null;

    // First remove the course from the original term
    await DBRemoveCourses(courseID, originTerm);

    // Then add it to the new term
    await DBAddCourses(courseID, term);

    // If the course had a grade, preserve it by setting the grade in the new location
    if (grade) {
      await DBUpdateGrade(courseID, term, grade);
    }

    setSaveStatus('saved');
  }, [DBRemoveCourses, DBAddCourses, DBUpdateGrade, studentSchedule, selectedYear, setSaveStatus]);

  const handlePlanDrop = useCallback((e: React.DragEvent<HTMLDivElement>) => {
    const isValidTarget = Array.from(validDropTargets).some(target =>
      target === e.target || target.contains(e.target as Node)
    );
    if (!isValidTarget) {
      e.preventDefault();
      e.stopPropagation();
      const data = e.dataTransfer.getData("application/json");
      if (data) {
        try {
          const courseData = JSON.parse(data);
          if (courseData.gold_id && courseData.originTerm) {
            setPoofingCourse({ id: courseData.gold_id, x: e.clientX, y: e.clientY });
            removeCourse(courseData, courseData.originTerm);
            DBRemoveCourses(courseData.id, courseData.originTerm);
            setTimeout(() => { setPoofingCourse(null); }, 500);
          }
        } catch (error) {
          console.error("Error parsing dragged course data:", error);
        }
      }
    }
  }, [validDropTargets, removeCourse, DBRemoveCourses]);


  const handleDragOver = useCallback((e: React.DragEvent<HTMLDivElement>, term: string) => {
    e.preventDefault();
    if (draggedOverTerm !== term) {
      setDraggedOverTerm(term);
    }
  }, [draggedOverTerm]);

  const handleDragLeave = useCallback((e: React.DragEvent<HTMLDivElement>) => {
    if (!e.currentTarget.contains(e.relatedTarget as Node)) {
      setDraggedOverTerm(null);
    }
  }, []);

  function handleDrop(e: React.DragEvent<HTMLDivElement>, term: Term) {
    e.preventDefault();
    e.stopPropagation();
    setDraggedOverTerm(null);
    const json = e.dataTransfer.getData("application/json");
    if (!json) return;
    const droppedCourse = JSON.parse(json);
    const { originTerm, ...course } = droppedCourse;
    const courseExists = studentSchedule[selectedYear][term].some(
      existingCourse => existingCourse.gold_id === course.gold_id
    );
    if (courseExists) return;
    if (originTerm && originTerm !== term) {
      removeCourse(course, originTerm);
      addCourse(course, term as Term);
      DBMoveCourse(course.id, originTerm, term);
    } else {
      addCourse(course, term as Term);
      DBAddCourses(course.id, term);
    }
  }

  function handleCourseReorder(e: React.DragEvent<HTMLDivElement>, term: Term, targetIndex: number) {
    e.preventDefault();
    e.stopPropagation();
    const data = e.dataTransfer.getData("application/json");
    if (!data) return;
    const dragged = JSON.parse(data);
    if (dragged.originTerm !== term) return;
    const sourceIndex = dragged.sourceIndex;
    if (sourceIndex === undefined || sourceIndex === targetIndex) return;
    const coursesArr = [...studentSchedule[selectedYear][term]];
    const [movedCourse] = coursesArr.splice(sourceIndex, 1);
    coursesArr.splice(targetIndex, 0, movedCourse);
    if (typeof reorderCourse === "function") {
      reorderCourse(selectedYear, term, coursesArr);
    }
  }

  const displayTerms = Terms.filter(term => term !== 'Summer' || showSummer);
  const yearDisplay = getYearDisplay(selectedYear);

  return (
    <div
      className="h-full w-full p-4 bg-white rounded-lg shadow-lg flex flex-col overflow-auto max-h-screen relative"
      ref={planRef}
      onDragOver={(e) => e.preventDefault()}
      onDrop={handlePlanDrop}
    >
      {selectedCourse && (
        <CourseModal
          course={selectedCourse.course}
          term={selectedCourse.term}
          onClose={() => setSelectedCourse(null)}
          onDelete={() => {
            removeCourse(selectedCourse.course, selectedCourse.term);
            DBRemoveCourses(selectedCourse.course.id, selectedCourse.term);
            setSelectedCourse(null);
          }}
          onGradeChange={async (grade) => {
            updateCourseGrade(selectedYear, selectedCourse.term, selectedCourse.course.gold_id, grade);
            await DBUpdateGrade(selectedCourse.course.id, selectedCourse.term, grade);
          }}
        />
      )}

      {isDataLoading && (
        <div className="absolute inset-0 bg-white bg-opacity-70 flex items-center justify-center z-10">
          <div className="text-lg font-medium text-gray-600 animate-pulse flex items-center">
            <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
              <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
              <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
            </svg>
            Loading your schedule...
          </div>
        </div>
      )}

      {poofingCourse && (
        <div
          className="fixed z-50 animate-poof"
          style={{
            left: poofingCourse.x - 50,
            top: poofingCourse.y - 50,
            width: '100px',
            height: '100px',
            background: 'rgba(255, 200, 200, 0.7)',
            borderRadius: '50%',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            pointerEvents: 'none'
          }}
        >
          <span className="text-xl">💨</span>
        </div>
      )}

      <div className="flex justify-between items-center mb-4">
        <div className="flex items-center">
          <h2 className="text-xl font-semibold">Four-Year Plan</h2>
          <div className="ml-3 flex items-center">
            {saveStatus === 'saving' ? (
              <span className="text-xs text-gray-500 animate-pulse">
                Saving...
              </span>
            ) : (
              <span className={`flex items-center text-xs ${isActive ? 'text-green-600' : 'text-gray-400 opacity-50'} transition-opacity duration-300`}>
                Saved
                <svg className="w-3 h-3 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7"></path>
                </svg>
              </span>
            )}
          </div>
        </div>
        <select
          className="p-2 border border-gray-300 rounded-lg"
          value={selectedYear}
          onChange={(e) => setSelectedYear(e.target.value as YearType)}
        >
          {Years.map((year, index) => (
            <option key={index} value={year}>
              {getYearDisplay(year)}
            </option>
          ))}
        </select>
      </div>

      <div className="flex gap-2 flex-1 min-h-0">
        <div
          ref={gridRef}
          className={`grid grid-cols-1 ${showSummer ? 'md:grid-cols-4' : 'md:grid-cols-3'} gap-2 flex-grow border border-gray-300 rounded-md p-2 bg-gray-50 min-h-0 overflow-y-auto`}
        >
          {displayTerms.map((term) => {
            const isPast = isQuarterInPast(yearDisplay, term);
            const isCurrent = isCurrentQuarter(yearDisplay, term);
            const statusBarColor = isCurrent ? "bg-[var(--pale-blue)]" : isPast ? "bg-[var(--pale-green)]" : "";
            const isTermDraggedOver = draggedOverTerm === term;
            return (
              <div
                key={term}
                data-term-column={term}
                onDragOver={(e) => handleDragOver(e, term)}
                onDragLeave={handleDragLeave}
                onDrop={(e) => handleDrop(e, term)}
                className="flex flex-col h-full justify-between p-4 border border-gray-300 rounded-lg bg-white relative"
              >
                {isDraggingCourse && isTermDraggedOver && (
                  <div className="absolute inset-0 pointer-events-none border-2 border-blue-400 rounded-lg"></div>
                )}
                {(isPast || isCurrent) && (
                  <div className={`h-3 absolute top-0 left-0 right-0 ${statusBarColor} rounded-t-lg`}></div>
                )}
                <div className="flex-grow">
                  <h3 className="text-lg font-semibold text-center mb-4">{term}</h3>
                  <div className="flex flex-col gap-4">
                    {studentSchedule[selectedYear][term].length > 0 ? (
                      studentSchedule[selectedYear][term].map((course, index) => {
                        const bgColorClass = course.generalEd.length === 0 ? "bg-[var(--pale-orange)]" : "bg-[var(--pale-pink)]";
                        return (
                          <div
                            key={course.gold_id}
                            draggable={true}
                            onDragStart={(e) => {
                              const courseData = { ...course, originTerm: term, sourceIndex: index };
                              e.dataTransfer.setData("application/json", JSON.stringify(courseData));
                            }}
                            onDragOver={(e) => e.preventDefault()}
                            onDrop={(e) => handleCourseReorder(e, term, index)}
                            onClick={() => setSelectedCourse({ course, term })}
                            className={`relative p-4 ${bgColorClass} rounded-lg group whitespace-normal break-words cursor-pointer hover:shadow-md transition-shadow`}
                          >
                            <div className="flex justify-between items-start">
                              <div>
                                <p className="font-bold text-sm">{course.gold_id}</p>
                                <p className="text-xs">{course.title}</p>
                                <p className="text-xs text-gray-500">{course.units} units</p>
                              </div>
                              {course.grade && (
                                <span className="text-xs text-gray-500">
                                  {course.grade}
                                </span>
                              )}
                            </div>
                            <div className="absolute bottom-2 left-1/2 transform -translate-x-1/2 opacity-0 group-hover:opacity-100 transition-opacity">
                              ···
                            </div>
                          </div>
                        );
                      })
                    ) : (
                      <p className="text-xs text-gray-500 text-center">No courses</p>
                    )}
                  </div>
                  <div className="relative mt-4">
                    <div className="p-4 border-dashed border-2 border-gray-300 rounded-lg text-center text-sm text-gray-400">
                      Drop Course Here
                    </div>
                    {isDraggingCourse && isTermDraggedOver && (
                      <div className="absolute inset-0 pointer-events-none border-dashed border-2 border-blue-400 rounded-lg animate-border-pulse"></div>
                    )}
                  </div>
                </div>
                <div className="mt-6 text-right">
                  <p className="font-light">
                    Total units: <span className="font-light"> {studentSchedule[selectedYear][term].reduce((sum, course) => sum + course.units, 0)}</span>
                  </p>
                </div>
              </div>
            );
          })}
        </div>
        <button
          onClick={() => setShowSummer(!showSummer)}
          className="writing-mode-vertical px-2 py-4 bg-[var(--pale-blue)] text-black rounded-lg transition-colors whitespace-nowrap h-auto"
        >
          {showSummer ? 'Hide Summer Quarter' : 'Show Summer Quarter'}
        </button>
      </div>
    </div>
  );
}
