import { useEffect, useState } from "react";
import { CircularProgressbar } from "react-circular-progressbar";
import "react-circular-progressbar/dist/styles.css";
import { Course, ScheduleType } from "./coursetypes";
import { buildStyles } from "react-circular-progressbar";

interface ProgressTrackerProps {
  studentSchedule: ScheduleType;
  courses: Course[];
  college?: string;
}

interface GERequirement {
  fulfilled: boolean;
  count: number;
  required: number; // number of courses per category
  courses: Course[];  // tracks courses for each requirement
}

const ProgressTracker = ({ studentSchedule, courses, college = "CoE" }: ProgressTrackerProps) => {
  const [overallProgress, setOverallProgress] = useState<number>(0);
  const [totalUnits, setTotalUnits] = useState<number>(0);
  const [coreCoursesTaken, setCoreCoursesTaken] = useState<Course[]>([]);
  const [genEdFulfilled, setGenEdFulfilled] = useState<{ [req: string]: GERequirement }>({});
  const [showAllCore, setShowAllCore] = useState<boolean>(false);
  const [expandedAreas, setExpandedAreas] = useState<{ [area: string]: boolean }>({});

  useEffect(() => {
    const scheduledCourseIds = Object.values(studentSchedule)
      .flatMap((terms) => Object.values(terms).flat())
      .map((course) => course.course_id);

    const completedCourseObjects = courses.filter((course) =>
      scheduledCourseIds.includes(course.course_id)
    );

    const totalUnitsTaken = completedCourseObjects.reduce(
      (sum, course) => sum + course.units,
      0
    );
    setTotalUnits(totalUnitsTaken);

    const overallPercentage = Math.min(
      Math.round((totalUnitsTaken / 180) * 100),
      100
    );
    setOverallProgress(overallPercentage);

    const completedCore = completedCourseObjects.filter(
      (course) => course.generalEd.length === 0
    );
    setCoreCoursesTaken(completedCore);
  }, [studentSchedule, courses]);

  useEffect(() => {
    const collegeRequirements: { [college: string]: { [area: string]: number } } = {
      "CoE": {
        "A1": 1,
        "A2": 1,
        "D": 2,
        "E": 2,
        "F": 1,
        "G": 1,
        "WRT": 4,
        "ETH": 1,
        "EUR": 1,
        "NWC": 1
      },
      "L&S": {} // Requirements for L&S would go here
    };

    const scheduledCourses = Object.values(studentSchedule)
      .flatMap((terms) => Object.values(terms).flat());

    const areaCounts: { [area: string]: number } = {};
    const areaCourses: { [area: string]: Course[] } = {};
    const requirements = collegeRequirements[college] || {};
    
    Object.keys(requirements).forEach(area => {
      areaCounts[area] = 0;
      areaCourses[area] = [];
    });

    // CoE is actually called ENGR in the geCode from API
    const collegeFromAPI = college === "CoE" ? "ENGR" : college;

    scheduledCourses.forEach((course) => {
      if (course.generalEd && course.generalEd.length > 0) {
        course.generalEd.forEach((geItem) => {
          if (typeof geItem === "object" && geItem !== null && "geCode" in geItem && "geCollege" in geItem) {
            const { geCode, geCollege } = geItem as { geCode: string; geCollege: string };
            if (geCollege.trim() === collegeFromAPI) {
              const trimmedCode = geCode.trim();
              if (trimmedCode in requirements) {
                areaCounts[trimmedCode]++;
                areaCourses[trimmedCode].push(course);
              }
            }
          } else {
            const geCode = typeof geItem === "string" ? geItem : String(geItem);
            const trimmedCode = geCode.trim();
            if (trimmedCode in requirements) {
              areaCounts[trimmedCode]++;
              areaCourses[trimmedCode].push(course);
            }
          }
        });
      }
    });

    const geStatus: { [area: string]: GERequirement } = {};
    Object.entries(requirements).forEach(([area, required]) => {
      geStatus[area] = {
        fulfilled: areaCounts[area] >= required,
        count: areaCounts[area],
        required: required,
        courses: areaCourses[area]
      };
    });

    setGenEdFulfilled(geStatus);
  }, [studentSchedule, college]);

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
            <li key={course.course_id} className="whitespace-normal overflow-wrap-anywhere">
              {course.course_id} ({course.units} units)
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
            <li key={course.course_id} className="whitespace-normal overflow-wrap-anywhere">
              {course.course_id} ({course.units} units)
            </li>
          ))}
        </ul>
        {courses.length > 1 && (
          <button
            className="text-blue-500 text-xs mt-1 focus:outline-none"
            onClick={() => setExpandedAreas(prev => ({ ...prev, [area]: !prev[area] }))}
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
    <div className="h-full p-4 bg-white rounded-md shadow-md overflow-auto">
      <h2 className="text-xl font-semibold mb-4">Courses Taken</h2>
      <div className="w-5/6 mx-auto mb-6">
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

      <h3 className="text-lg font-semibold mb-2">Core Courses</h3>
      {coreCoursesTaken.length > 0 ? (
        renderCourseList(coreCoursesTaken, showAllCore, setShowAllCore)
      ) : (
        <p className="text-sm text-gray-500">No core courses taken yet.</p>
      )}

      <h3 className="text-lg font-semibold mt-6 mb-2">
        GE Courses
      </h3>

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
    </div>
  );
};

export default ProgressTracker;
