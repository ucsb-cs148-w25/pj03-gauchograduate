import { useEffect, useState } from "react";
import { CircularProgressbar } from "react-circular-progressbar";
import "react-circular-progressbar/dist/styles.css";
import { Course, ScheduleType } from "./coursetypes";
import { buildStyles } from "react-circular-progressbar";

interface ProgressTrackerProps {
  studentSchedule: ScheduleType;
  courses: Course[];
}

const ProgressTracker = ({ studentSchedule, courses }: ProgressTrackerProps) => {
  // overall progress now based on units taken out of 180
  const [overallProgress, setOverallProgress] = useState<number>(0);
  const [totalUnits, setTotalUnits] = useState<number>(0);
  const [coreCoursesTaken, setCoreCoursesTaken] = useState<Course[]>([]);
  const [genEdCoursesTaken, setGenEdCoursesTaken] = useState<Course[]>([]);
  const [showAllCore, setShowAllCore] = useState<boolean>(false);
  const [showAllGenEd, setShowAllGenEd] = useState<boolean>(false);

  useEffect(() => {
    const scheduledCourseIds = Object.values(studentSchedule)
      .flatMap((terms) => Object.values(terms).flat())
      .map((course) => course.course_id);

      const completedCourseObjects = courses.filter((course) =>
      scheduledCourseIds.includes(course.course_id)
    );

    // sum of total units taken
    const totalUnitsTaken = completedCourseObjects.reduce(
      (sum, course) => sum + course.units,
      0
    );
    setTotalUnits(totalUnitsTaken);

    // Calculate overall progress as a percentage (capped at 100).
    const overallPercentage = Math.min(
      Math.round((totalUnitsTaken / 180) * 100),
      100
    );
    setOverallProgress(overallPercentage);

    // core vs gened courses completed
    const completedCore = completedCourseObjects.filter(
      (course) => course.generalEd.length === 0
    );
    const completedGenEd = completedCourseObjects.filter(
      (course) => course.generalEd.length > 0
    );
    setCoreCoursesTaken(completedCore);
    setGenEdCoursesTaken(completedGenEd);
  }, [studentSchedule, courses]);

  // collapsable list component that only shows first three courses taken
  const renderCourseList = (
    coursesList: Course[],
    showAll: boolean,
    setShowAll: (value: boolean) => void
  ) => {
    const itemsToShow = showAll ? coursesList : coursesList.slice(0, 3);

    return (
      <div>
        <ul className="list-disc ml-5 space-y-1 break-words">
          {itemsToShow.map((course) => (
            <li key={course.course_id} className="whitespace-normal overflow-wrap-anywhere">
              {course.course_id} ({course.units} units)
            </li>
          ))}
        </ul>
        {coursesList.length > 3 && (
          <button
            className="text-blue-500 text-sm mt-2 focus:outline-none"
            onClick={() => setShowAll(!showAll)}
          >
            {showAll ? "Show Less" : "Show More"}
          </button>
        )}
      </div>
    );
  };

  return (
    <div className="h-full p-4 bg-white rounded-md shadow-md overflow-auto">
      <h2 className="text-xl font-semibold mb-4">Graduation Progress</h2>

      {/* Overall Progress: Circular progress bar based on units taken */}
      <div className="w-2/3 mx-auto mb-6">
        <CircularProgressbar
          value={overallProgress}
          text={`${overallProgress}%`}
          styles={buildStyles({
            pathColor: "var(--pale-blue)",
            trailColor: "var(--off-white)",
            textColor: "var(--foreground)"
          })}
        />
        <p className="text-center text-sm mt-2">{`${totalUnits} / 180 Units Completed`}</p>
      </div>

      {/* Core Courses Taken */}
      <h3 className="text-lg font-semibold mb-2">Core Courses Taken</h3>
      {coreCoursesTaken.length > 0 ? (
        renderCourseList(coreCoursesTaken, showAllCore, setShowAllCore)
      ) : (
        <p className="text-sm text-gray-500">No core courses taken yet.</p>
      )}

      {/* General Education Courses Taken */}
      <h3 className="text-lg font-semibold mt-6 mb-2">
        General Education Courses Taken
      </h3>
      {genEdCoursesTaken.length > 0 ? (
        renderCourseList(genEdCoursesTaken, showAllGenEd, setShowAllGenEd)
      ) : (
        <p className="text-sm text-gray-500">No Gen Ed courses taken yet.</p>
      )}
    </div>
  );
};

export default ProgressTracker;
