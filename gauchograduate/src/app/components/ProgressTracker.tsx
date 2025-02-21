import { useEffect, useState } from "react";
import { CircularProgressbar } from "react-circular-progressbar";
import "react-circular-progressbar/dist/styles.css";
import { Course, ScheduleType } from "./coursetypes";
import { buildStyles } from "react-circular-progressbar";
import { computeGERequirements, GERequirement } from "./requirements/GEReqs";
import { computeMajorRequirements } from "./requirements/COREReqs";

interface ProgressTrackerProps {
  studentSchedule: ScheduleType;
  courses: Course[];
  college?: string;
}

const ProgressTracker = ({ studentSchedule, courses, college = "CoE" }: ProgressTrackerProps) => {
  // Existing state
  const [overallProgress, setOverallProgress] = useState<number>(0);
  const [totalUnits, setTotalUnits] = useState<number>(0);
  const [coreCoursesTaken, setCoreCoursesTaken] = useState<Course[]>([]);
  const [genEdFulfilled, setGenEdFulfilled] = useState<{ [req: string]: GERequirement }>({});
  const [showAllCore, setShowAllCore] = useState<boolean>(false);
  const [expandedAreas, setExpandedAreas] = useState<{ [area: string]: boolean }>({});

  // State for major requirements
  const [majorData, setMajorData] = useState<any>(null);
  const [majorStatus, setMajorStatus] = useState<{ [key: string]: GERequirement }>({});
  const [expandedMajorAreas, setExpandedMajorAreas] = useState<{ [area: string]: boolean }>({});

  // Process schedule for overall progress and core courses.
  useEffect(() => {
    const scheduledCourseIds = Object.values(studentSchedule)
      .flatMap((terms) => Object.values(terms).flat())
      .map((course) => course.gold_id);

    const completedCourseObjects = courses.filter((course) =>
      scheduledCourseIds.includes(course.gold_id)
    );

    const totalUnitsTaken = completedCourseObjects.reduce(
      (sum, course) => sum + course.units,
      0
    );
    setTotalUnits(totalUnitsTaken);

    const overallPercentage = Math.min(Math.round((totalUnitsTaken / 180) * 100), 100);
    setOverallProgress(overallPercentage);

    const completedCore = completedCourseObjects.filter(
      (course) => course.generalEd.length === 0
    );
    setCoreCoursesTaken(completedCore);
  }, [studentSchedule, courses]);

  // Use the GE helper function.
  useEffect(() => {
    const geStatus = computeGERequirements(studentSchedule, college);
    setGenEdFulfilled(geStatus);
  }, [studentSchedule, college]);

  // Fetch major info from the API.
  useEffect(() => {
    fetch("/api/user/major")
      .then((res) => res.json())
      .then((data) => {
        if (data && data.major) {
          console.log("Fetched major data:", data.major); // Debug log
          setMajorData(data.major);
        }
      })
      .catch((err) => console.error(err));
  }, []);

  // Use the major helper function.
  useEffect(() => {
    if (!majorData) return;
    const newMajorStatus = computeMajorRequirements(studentSchedule, courses, majorData);
    setMajorStatus(newMajorStatus);
  }, [studentSchedule, courses, majorData]);

  const areaDescriptions: { [key: string]: string } = {
    "A1": "Oral Communication",
    "A2": "Written Communication",
    "D": "Social Sciences",
    "E": "Culture and Thought",
    "F": "Arts",
    "G": "Literature",
    "WRT": "Writing Requirement",
    "ETH": "Ethnicity Requirement",
    "EUR": "European Traditions",
    "NWC": "World Cultures"
  };

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
            <li key={course.gold_id} className="whitespace-normal overflow-wrap-anywhere">
              {course.gold_id} ({course.units} units)
            </li>
          ))}
        </ul>
        {coursesList.length > 3 && (
          <button
            className="text-blue-500 text-sm mt-2 focus:outline-none"
            onClick={() => setShowAll(!showAll)}
            aria-expanded={showAll}
            aria-label={showAll ? "Show fewer core courses" : "Show more core courses"}
          >
            {showAll ? "Show Less" : "Show More"}
          </button>
        )}
      </div>
    );
  };

  const renderGECourseList = (area: string) => {
    const courses = genEdFulfilled[area]?.courses || [];
    const isExpanded = expandedAreas[area] || false;
    const itemsToShow = isExpanded ? courses : courses.slice(0, 1);

    if (courses.length === 0) return null;

    return (
      <div className="ml-8 mt-1">
        <ul className="list-disc space-y-1 break-words text-sm text-gray-600">
          {itemsToShow.map((course) => (
            <li key={course.gold_id} className="whitespace-normal overflow-wrap-anywhere">
              {course.gold_id} ({course.units} units)
            </li>
          ))}
        </ul>
        {courses.length > 1 && (
          <button
            className="text-blue-500 text-xs mt-1 focus:outline-none"
            onClick={() =>
              setExpandedAreas((prev) => ({ ...prev, [area]: !prev[area] }))
            }
            aria-expanded={isExpanded}
            aria-label={isExpanded ? `Show fewer ${area} courses` : `Show more ${area} courses`}
          >
            {isExpanded ? "Show Less" : "Show More"}
          </button>
        )}
      </div>
    );
  };

  const renderMajorCourseList = (area: string, courses: Course[] = []) => {
    const isExpanded = expandedMajorAreas[area] || false;
    const itemsToShow = isExpanded ? courses : courses.slice(0, 1);
    if (courses.length === 0) return null;
    return (
      <div className="ml-8 mt-1">
        <ul className="list-disc space-y-1 break-words text-sm text-gray-600">
          {itemsToShow.map((course) => (
            <li key={course.gold_id}>
              {course.gold_id} ({course.units} units)
            </li>
          ))}
        </ul>
        {courses.length > 1 && (
          <button
            className="text-blue-500 text-xs mt-1 focus:outline-none"
            onClick={() =>
              setExpandedMajorAreas((prev) => ({ ...prev, [area]: !prev[area] }))
            }
            aria-expanded={isExpanded}
            aria-label={isExpanded ? `Show fewer ${area} courses` : `Show more ${area} courses`}
          >
            {isExpanded ? "Show Less" : "Show More"}
          </button>
        )}
      </div>
    );
  };

  return (
    <div className="h-full p-4 overflow-auto">
      <h2 className="text-xl font-semibold mb-4">Courses Taken</h2>
      <div className="w-5/6 mx-auto mb-6">
        <CircularProgressbar
          value={overallProgress}
          text={`${overallProgress}%`}
          styles={buildStyles({
            pathColor: "var(--pale-blue)",
            trailColor: "var(--background)",
            textColor: "var(--foreground)"
          })}
        />
        <p className="text-center text-sm mt-2">{`${totalUnits} / 180 Units Completed`}</p>
      </div>

      {/* <h3 className="text-lg font-semibold mb-2">Core Courses</h3>
      {coreCoursesTaken.length > 0 ? (
        renderCourseList(coreCoursesTaken, showAllCore, setShowAllCore)
      ) : (
        <p className="text-sm text-gray-500">No core courses taken yet.</p>
      )} */}

      <h3 className="text-lg font-semibold mt-6 mb-2">GE Courses</h3>
      <div role="region" aria-label="General Education Requirements">
        <h4 className="text-md font-semibold">Area Requirements</h4>
        <ul className="list-none space-y-2 ml-4">
          {["A1", "A2", "D", "E", "F", "G"].map((area) => (
            <li key={area}>
              <div className="flex items-center justify-between">
                <div className="flex items-center">
                  <input
                    type="checkbox"
                    readOnly
                    checked={!!genEdFulfilled[area]?.fulfilled}
                    className="mr-2"
                    aria-label={`${area} requirement fulfilled`}
                  />
                  <span title={areaDescriptions[area]}>{area}</span>
                </div>
                <span className="text-sm text-gray-600">
                  {genEdFulfilled[area]?.count || 0}/{genEdFulfilled[area]?.required || 0} courses
                </span>
              </div>
              {renderGECourseList(area)}
            </li>
          ))}
        </ul>

        <h4 className="text-md font-semibold mt-4">Additional Requirements</h4>
        <ul className="list-none space-y-2 ml-4">
          {["WRT", "ETH", "EUR", "NWC"].map((area) => (
            <li key={area}>
              <div className="flex items-center justify-between">
                <div className="flex items-center">
                  <input
                    type="checkbox"
                    readOnly
                    checked={!!genEdFulfilled[area]?.fulfilled}
                    className="mr-2"
                    aria-label={`${area} requirement fulfilled`}
                  />
                  <span title={areaDescriptions[area]}>{area}</span>
                </div>
                <span className="text-sm text-gray-600">
                  {genEdFulfilled[area]?.count || 0}/{genEdFulfilled[area]?.required || 0} courses
                </span>
              </div>
              {renderGECourseList(area)}
            </li>
          ))}
        </ul>
      </div>

      {/* Major Requirements Section */}
      <h3 className="text-lg font-semibold mt-6 mb-2">
        Major Requirements {majorData ? `(${majorData.name})` : ""}
      </h3>
      <div role="region" aria-label="Major Requirements">
        <ul className="list-none space-y-2 ml-4">
          <li>
            <div className="flex items-center justify-between">
              <div className="flex items-center">
                <input
                  type="checkbox"
                  readOnly
                  checked={!!majorStatus.preparation?.fulfilled}
                  className="mr-2"
                  aria-label="Lower Division (Preparation) requirement fulfilled"
                />
                <span>Lower Division (Preparation)</span>
              </div>
              <span className="text-sm text-gray-600">
                {majorStatus.preparation?.count || 0}/{majorStatus.preparation?.required || 0} courses
              </span>
            </div>
            {renderMajorCourseList("preparation", majorStatus.preparation?.courses || [])}
          </li>
          <li>
            <div className="flex items-center justify-between">
              <div className="flex items-center">
                <input
                  type="checkbox"
                  readOnly
                  checked={!!majorStatus.upperRequired?.fulfilled}
                  className="mr-2"
                  aria-label="Upper Division (Required) requirement fulfilled"
                />
                <span>Upper Division (Required)</span>
              </div>
              <span className="text-sm text-gray-600">
                {majorStatus.upperRequired?.count || 0}/{majorStatus.upperRequired?.required || 0} courses
              </span>
            </div>
            {renderMajorCourseList("upperRequired", majorStatus.upperRequired?.courses || [])}
          </li>
          <li>
            <div className="flex items-center justify-between">
              <div className="flex items-center">
                <input
                  type="checkbox"
                  readOnly
                  checked={!!majorStatus.upperElectives?.fulfilled}
                  className="mr-2"
                  aria-label="Upper Division (Electives) requirement fulfilled"
                />
                <span>Upper Division (Electives)</span>
              </div>
              <span className="text-sm text-gray-600">
                {majorStatus.upperElectives?.count || 0}/{majorStatus.upperElectives?.required || 0} courses
              </span>
            </div>
            {renderMajorCourseList("upperElectives", majorStatus.upperElectives?.courses || [])}
          </li>
        </ul>
      </div>
    </div>
  );
};

export default ProgressTracker;
