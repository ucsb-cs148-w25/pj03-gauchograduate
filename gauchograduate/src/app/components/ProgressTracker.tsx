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
  const [overallProgress, setOverallProgress] = useState<number>(0); // Overall progress
  const [coreProgress, setCoreProgress] = useState<number>(0); // Core course progress
  const [genEdProgress, setGenEdProgress] = useState<number>(0); // Gen Ed progress
  const [coreRequirements, setCoreRequirements] = useState<string[]>([]);
  const [genEdRequirements, setGenEdRequirements] = useState<string[]>([]);
  const [completedCourses, setCompletedCourses] = useState<string[]>([]); // Courses added to schedule

  useEffect(() => {
    // Extract Core and Gen Ed requirements
    const coreCourses = courses
      .filter((course) => course.generalEd === "Core")
      .map((course) => course.course_id);

    const genEdCourses = courses
      .filter((course) => course.generalEd === "Gen Ed")
      .map((course) => course.course_id);

    setCoreRequirements(coreCourses);
    setGenEdRequirements(genEdCourses);

    // Find scheduled courses
    const scheduledCourses = Object.values(studentSchedule)
      .flatMap((terms) => Object.values(terms).flat())
      .map((course) => course.course_id);

    setCompletedCourses(scheduledCourses);

    // Calculate progress for Core Courses
    const completedCoreCount = scheduledCourses.filter((id) =>
      coreCourses.includes(id)
    ).length;
    const corePercentage = coreCourses.length
      ? Math.round((completedCoreCount / coreCourses.length) * 100)
      : 0;

    // Calculate progress for Gen Ed Courses
    const completedGenEdCount = scheduledCourses.filter((id) =>
      genEdCourses.includes(id)
    ).length;
    const genEdPercentage = genEdCourses.length
      ? Math.round((completedGenEdCount / genEdCourses.length) * 100)
      : 0;

    // Calculate overall progress
    const totalCourses = coreCourses.length + genEdCourses.length;
    const overallCompleted = completedCoreCount + completedGenEdCount;
    const overallPercentage = totalCourses
      ? Math.round((overallCompleted / totalCourses) * 100)
      : 0;

    // Update state
    setCoreProgress(corePercentage);
    setGenEdProgress(genEdPercentage);
    setOverallProgress(overallPercentage);
  }, [studentSchedule, courses]);

  // Helper function to render horizontal progress bars
  const renderProgressBar = (percentage: number, colorVar: string) => (
    <div className="w-full bg-gray-200 rounded-full h-4"
    style= {{
      backgroundColor: "var(--off-white)"
    }}>
      <div
        className="bg-blue-500 h-4 rounded-full"
        style={{ 
          width: `${percentage}%`,
          backgroundColor: `var(${colorVar})` }}
      ></div>
    </div>
  );

  return (
    <div className="h-full p-4 bg-white rounded-md shadow-md">
      <h2 className="text-xl font-semibold mb-4">Graduation Progress</h2>

      {/* Circular Progress Bar for Overall Progress */}
      <div className="w-2/3 mx-auto mb-6">
        <CircularProgressbar 
          value={overallProgress}
          text={`${overallProgress}%`}
          styles={buildStyles({
            pathColor: "var(--pale-blue)",
            trailColor: "var(--off-white)",
            textColor: "var(--foreground)"
          })} />
        <p className="text-center text-sm mt-2">Overall Progress</p>
      </div>

      {/* Horizontal Progress Bar for Core Courses */}
      <h3 className="text-lg font-semibold mb-2">Core Courses</h3>
      <div className="mb-6">
        {renderProgressBar(coreProgress, "--pale-orange")}
        <p className="text-sm text-gray-500 mt-1">{`${coreProgress}% of Core Courses Completed`}</p>
      </div>
      <ul className="list-none space-y-2 mb-4">
        {coreRequirements.map((req) => (
          <li key={req} className="flex items-center">
            <input
              type="checkbox"
              checked={completedCourses.includes(req)} // Checked if in schedule
              readOnly
              className="mr-2"
            />
            <span>{req}</span>
          </li>
        ))}
      </ul>

      {/* Horizontal Progress Bar for General Education */}
      <h3 className="text-lg font-semibold mb-2">General Education</h3>
      <div className="mb-6">
        {renderProgressBar(genEdProgress, "--pale-pink")}
        <p className="text-sm text-gray-500 mt-1">{`${genEdProgress}% of Gen Ed Courses Completed`}</p>
      </div>
      <ul className="list-none space-y-2">
        {genEdRequirements.map((req) => (
          <li key={req} className="flex items-center">
            <input
              type="checkbox"
              checked={completedCourses.includes(req)} // Checked if in schedule
              readOnly
              className="mr-2"
            />
            <span>{req}</span>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ProgressTracker;