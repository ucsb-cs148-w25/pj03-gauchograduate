import { useSession } from 'next-auth/react';
import { Terms, Years, Course, Term, FourYearPlanProps, YearType } from "./coursetypes";
import { useState } from 'react';
import { getAcademicYear, isQuarterInPast, isCurrentQuarter } from './utils/quarterUtils';
import CourseModal from './course-popup';

export default function FourYearPlan({ selectedYear, setSelectedYear, studentSchedule, addCourse, removeCourse }: FourYearPlanProps) {
  const { data: session } = useSession();
  const firstQuarter = session?.user?.courses?.firstQuarter || '20224';
  const [showSummer, setShowSummer] = useState(false);
  const [selectedCourse, setSelectedCourse] = useState<{ course: Course, term: Term } | null>(null);

  const getYearDisplay = (year: YearType): string => {
    const yearIndex = Years.indexOf(year);
    return getAcademicYear(firstQuarter, yearIndex);
  };

  const termToQuarter: { [key in Term]: string } = {
    Fall: "20241",
    Winter: "20242",
    Spring: "20243",
    Summer: "20244",
  };


  async function DBAddCourses(courseID: number, term: Term) {
    try {

      const response = await fetch("/api/user/add-course", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          id: courseID,
          quarter: termToQuarter[term],
        }),
      });

      const data = await response.json();
      console.log("Response:", data);
    } catch (error) {
      console.error("Error adding courses:", error);
    }
  }

  async function DBRemoveCourses(courseID: number, term: Term) {
    try {

      const response = await fetch("/api/user/remove-course", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          id: courseID,
          quarter: termToQuarter[term],
        }),
      });

      const data = await response.json();
      console.log("Response:", data);
    } catch (error) {
      console.error("Error removing courses:", error);
    }
  }

  function handleDrop(e: React.DragEvent<HTMLDivElement>, term: Term) {
    e.preventDefault();
    const json = e.dataTransfer.getData("application/json");
    if (!json) return;
    const droppedCourse = JSON.parse(json);
    const { originTerm, ...course } = droppedCourse;

    const courseExists = studentSchedule[selectedYear][term].some(
      existingCourse => existingCourse.gold_id === course.gold_id
    );

    if (courseExists) {
      return;
    }
    // In case the course was moved from another quarter, first we drop then we re-add
    if (originTerm && originTerm !== term) {
      removeCourse(course, originTerm);
    }
    addCourse(course, term as Term);
    DBAddCourses(course.id, term);
  }

  const displayTerms = Terms.filter(term => term !== 'Summer' || showSummer);
  const yearDisplay = getYearDisplay(selectedYear);

  return (
    <div className="h-full w-full p-4 bg-white rounded-lg shadow-lg flex flex-col overflow-auto max-h-screen">
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
        />
      )}

      <div className="flex justify-between items-center mb-4">
        <h2 className="text-xl font-semibold">Four-Year Plan</h2>
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
        <div className={`grid grid-cols-1 ${showSummer ? 'md:grid-cols-4' : 'md:grid-cols-3'} gap-2 flex-grow border border-gray-300 rounded-md p-2 bg-gray-50 min-h-0 overflow-y-auto`}>
          {displayTerms.map((term) => {
            const isPast = isQuarterInPast(yearDisplay, term);
            const isCurrent = isCurrentQuarter(yearDisplay, term);
            const bgColor = isCurrent ? "bg-[var(--pale-blue)]" : isPast ? "bg-[var(--pale-green)]" : "bg-white";

            return (
              <div
                key={term}
                onDragOver={(e) => e.preventDefault()}
                onDrop={(e) => handleDrop(e, term)}
                className={`flex flex-col h-full justify-between p-4 border border-gray-300 rounded-lg ${bgColor}`}
              >
                <div className="flex-grow">
                  <h3 className="text-lg font-semibold text-center mb-4">{term}</h3>
                  <div className="flex flex-col gap-4">
                    {studentSchedule[selectedYear][term].length > 0 ? (
                      studentSchedule[selectedYear][term].map((course) => {
                        const bgColorClass = course.generalEd.length === 0 ? "bg-[var(--pale-orange)]" : "bg-[var(--pale-pink)]";
                        return (
                          <div
                            key={course.gold_id}
                            draggable={true}
                            onDragStart={(e) => {
                              const courseData = { ...course, originTerm: term };
                              e.dataTransfer.setData("application/json", JSON.stringify(courseData));
                            }}
                            onClick={() => setSelectedCourse({ course, term })}
                            className={`relative p-4 ${bgColorClass} rounded-lg group whitespace-normal break-words cursor-pointer hover:shadow-md transition-shadow`}
                          >
                            <p className="font-bold text-sm">{course.gold_id}</p>
                            <p className="text-xs">{course.title}</p>
                            <p className="text-xs text-gray-500">{course.units} units</p>
                          </div>
                        );
                      })
                    ) : (
                      <p className="text-xs text-gray-500 text-center">No courses</p>
                    )}
                  </div>
                  <div className="mt-4 p-4 border-dashed border-2 border-gray-300 rounded-lg text-center text-sm text-gray-400">
                    Drop Course Here
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
