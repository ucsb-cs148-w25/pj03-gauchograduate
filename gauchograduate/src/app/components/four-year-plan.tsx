import DeleteIcon from '@mui/icons-material/Delete'
import { useSession } from 'next-auth/react';
import { Terms, Years, Course, ScheduleType, YearType, Term } from "./coursetypes";
import { useState } from 'react';

interface FourYearPlanProps {
  selectedYear: YearType;
  setSelectedYear: React.Dispatch<React.SetStateAction<YearType>>;
  studentSchedule: ScheduleType;
  addCourse: (course: Course, term: Term) => void;
  removeCourse: (course: Course, term: Term) => void;
}

export function getAcademicYear(quarterCode: string, yearOffset: number = 0): string {
  const year = parseInt(quarterCode.substring(0, 4));
  const shortYear = (year + yearOffset).toString().slice(2);
  const nextYear = ((year + yearOffset + 1) % 100).toString().padStart(2, '0');
  return `'${shortYear}-'${nextYear}`;
}

export default function FourYearPlan({ selectedYear, setSelectedYear, studentSchedule, addCourse, removeCourse}: FourYearPlanProps) { 
  const { data: session } = useSession();
  const firstQuarter = session?.user?.courses?.firstQuarter || '20234';
  const [showSummer, setShowSummer] = useState(false);
  
  const getYearDisplay = (year: YearType): string => {
    const yearIndex = Years.indexOf(year);
    return getAcademicYear(firstQuarter, yearIndex);
  };

  function handleDrop(e: React.DragEvent<HTMLDivElement>, term: Term) {
    e.preventDefault();
    const json = e.dataTransfer.getData("application/json");
    if (!json) return;
    const droppedCourse = JSON.parse(json);
    const { originTerm, ...course } = droppedCourse;

    const courseExists = studentSchedule[selectedYear][term].some(
      existingCourse => existingCourse.course_id === course.course_id
    );
    
    if (courseExists) {
      return;
    }

    if (originTerm && originTerm !== term) {
      removeCourse(course, originTerm);
    }
    addCourse(course, term as Term);
  }

  const displayTerms = Terms.filter(term => term !== 'Summer' || showSummer);

  return (
    <div className="h-full w-full p-4 bg-white rounded-lg shadow-lg flex flex-col overflow-auto max-h-screen">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-xl font-semibold">Four-Year Plan</h2>
        <div className="flex items-center gap-4">
          <label className="flex items-center gap-2 text-sm">
            <input
              type="checkbox"
              checked={showSummer}
              onChange={(e) => setShowSummer(e.target.checked)}
              className="rounded border-gray-300"
            />
            Show Summer Quarter
          </label>
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
      </div>

      <div className={`grid grid-cols-1 ${showSummer ? 'md:grid-cols-4' : 'md:grid-cols-3'} gap-2 flex-grow border border-gray-300 rounded-md p-2 bg-gray-50 min-h-0 overflow-y-auto`}>
        {displayTerms.map((term) => (
          <div
            key={term}
            onDragOver={(e) => e.preventDefault()}
            onDrop={(e) => handleDrop(e, term)}
            className="flex flex-col h-full justify-between p-4 border border-gray-300 rounded-lg bg-white"
          >
            <div className="flex-grow">
              <h3 className="text-lg font-semibold text-center mb-4">{term}</h3>
              <div className="flex flex-col gap-4">
                {studentSchedule[selectedYear][term].length > 0 ? (
                  studentSchedule[selectedYear][term].map((course) => {
                    const bgColorClass = course.generalEd.length === 0  ? "bg-[var(--pale-orange)]" : "bg-[var(--pale-pink)]"; 
                    return (
                    <div 
                      key={course.course_id}
                      draggable = {true}
                      onDragStart={(e) => {
                        const courseData = { ...course, originTerm: term };
                        e.dataTransfer.setData("application/json", JSON.stringify(courseData));
                      }}
                      className={`relative p-4 ${bgColorClass} rounded-lg group whitespace-normal break-words`}
                    >
                      <p className="font-bold text-sm">{course.course_id}</p>
                      <p className="text-xs">{course.title}</p>
                      <p className="text-xs text-gray-500">{course.units} units</p>
                      <button
                        className="bg-red-500 text-white p-1 rounded-full opacity-0 group-hover:opacity-100"
                        onClick={() => removeCourse(course, term)}
                      >
                        <DeleteIcon fontSize="small" />
                      </button>
                    </div>
                  );})
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
        ))}
      </div>
    </div>
  );
}
