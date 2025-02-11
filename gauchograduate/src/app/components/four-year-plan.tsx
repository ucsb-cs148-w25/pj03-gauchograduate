import DeleteIcon from '@mui/icons-material/Delete'

import { Terms, Years, Course, ScheduleType, YearType, Term } from "./coursetypes";

interface FourYearPlanProps {
  selectedYear: YearType;
  setSelectedYear: React.Dispatch<React.SetStateAction<YearType>>;
  studentSchedule: ScheduleType;
  addCourse: (course: Course, term: Term) => void;
  removeCourse: (course: Course, term: Term) => void;
}


export default function FourYearPlan({ selectedYear, setSelectedYear, studentSchedule, addCourse, removeCourse}: FourYearPlanProps) { 
  
  function handleDrop(e: React.DragEvent<HTMLDivElement>, term: Term) {
    e.preventDefault();
    // gets the course thats dropped
    const json = e.dataTransfer.getData("application/json");
    if (!json) return;
    const droppedCourse = JSON.parse(json);
    const { originTerm, ...course } = droppedCourse;
    if (originTerm && originTerm !== term) {
      removeCourse(course, originTerm);
    }
    // now we just update the schedule
    addCourse(course, term as Term);
  }

  return (
    <div className="h-full w-full p-4 bg-white rounded-lg shadow-lg flex flex-col overflow-auto max-h-screen">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-xl font-semibold">Four-Year Plan</h2>
        {/* Year Selector */}
        <select 
        className="p-2 border border-gray-300 rounded-lg" 
        value={selectedYear}
        onChange={(e) => setSelectedYear(e.target.value as YearType)}
        >
          {Years.map((year, index) => (
            <option key={index} value={year}>
              {year}
            </option>
          ))}
        </select>
      </div>

      {/* Plan Table */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-2 flex-grow border border-gray-300 rounded-md p-2 bg-gray-50 min-h-0 overflow-y-auto">
        {Terms.map((term) => (
          <div
            key={term}
            onDragOver={(e) => e.preventDefault()}
            onDrop={(e) => handleDrop(e, term)}
            className="flex flex-col h-full justify-between p-4 border border-gray-300 rounded-lg bg-white"
          >
            <div className="flex-grow">
              <h3 className="text-lg font-semibold text-center mb-4">{term}</h3>
              <div className="flex flex-col gap-4">
                {/* Course cards */}
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
          
                      {/* course details */}
                      <p className="font-bold text-sm">{course.course_id}</p>
                      <p className="text-xs">{course.title}</p>
                      <p className="text-xs text-gray-500">{course.units} units</p>

                      {/* hover to click on delete button */}
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
