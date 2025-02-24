import { useEffect, useState } from "react";
import "react-circular-progressbar/dist/styles.css";
import { Course, MajorData, ScheduleType } from "./coursetypes";
import { computeGERequirements, GERequirement } from "./requirements/GEReqs";
import { computeMajorRequirements } from "./requirements/COREReqs";
import SegmentedProgressBar from "./progress_components/SegmentedProgressBar";
import CollapsibleCard from "./progress_components/CollapsibleCard";

interface ProgressTrackerProps {
  studentSchedule: ScheduleType;
  college?: string;
}

const ProgressTracker = ({ studentSchedule, college = "CoE" }: ProgressTrackerProps) => {
  const [totalUnits, setTotalUnits] = useState<number>(0);
  const [scheduledCourses, setScheduledCourses] = useState<Course[]>([]);

  // GE requirements state
  const [genEdFulfilled, setGenEdFulfilled] = useState<{ [req: string]: GERequirement }>({});
  const [expandedAreas, setExpandedAreas] = useState<{ [area: string]: boolean }>({});

  // Major requirements state
  const [majorData, setMajorData] = useState<MajorData | null>(null);
  const [majorStatus, setMajorStatus] = useState<{ [key: string]: GERequirement }>({});
  const [expandedMajorAreas, setExpandedMajorAreas] = useState<{ [area: string]: boolean }>({});

  // Extra courses state
  const [extraCourses, setExtraCourses] = useState<Course[]>([]);
  const [showAllExtra, setShowAllExtra] = useState(false);

  // Extract scheduled courses from studentSchedule
  useEffect(() => {
    const allCourses = Object.values(studentSchedule)
      .flatMap((terms) => Object.values(terms).flat());
    setScheduledCourses(allCourses);
    const totalUnitsTaken = allCourses.reduce(
      (sum, course) => sum + course.units,
      0
    );
    setTotalUnits(totalUnitsTaken);
  }, [studentSchedule]);

  // Compute GE requirements.
  useEffect(() => {
    const geStatus = computeGERequirements(studentSchedule, college);
    setGenEdFulfilled(geStatus);
  }, [studentSchedule, college]);

  // Fetch major data.
  useEffect(() => {
    fetch("/api/user/major")
      .then((res) => res.json())
      .then((data) => {
        if (data && data.major) {
          console.log("Fetched major data:", data.major);
          setMajorData(data.major);
        }
      })
      .catch((err) => console.error(err));
  }, []);

  // Compute major requirements.
  useEffect(() => {
    if (!majorData) return;
    const allCourses = Object.values(studentSchedule)
      .flatMap((terms) => Object.values(terms).flat());
    const newMajorStatus = computeMajorRequirements(studentSchedule, allCourses, majorData);
    setMajorStatus(newMajorStatus);
  }, [studentSchedule, majorData]);

  // Compute extra courses: core courses not used for major requirements.
  useEffect(() => {
    // Core courses: courses with no GE info.
    const coreCourses = scheduledCourses.filter((course) => course.generalEd.length === 0);

    // Gather internal IDs of courses used in major requirements.
    const usedCourseIds = new Set<string>();
    Object.values(majorStatus).forEach((category) => {
      category.courses.forEach((course) => usedCourseIds.add(String(course.id)));
    });

    // Extra courses are core courses that are not used in major requirements.
    const extras = coreCourses.filter((course) => !usedCourseIds.has(String(course.id)));
    setExtraCourses(extras);
  }, [scheduledCourses, majorStatus]);

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

  const renderExtraCoursesList = () => {
    const itemsToShow = showAllExtra ? extraCourses : extraCourses.slice(0, 3);
    if (extraCourses.length === 0) return <p className="ml-5 text-sm text-gray-500">No extra courses taken.</p>;
    return (
      <div className="ml-5">
        <ul className="list-disc space-y-1 break-words">
          {itemsToShow.map((course) => (
            <li key={course.gold_id}>
              {course.gold_id} ({course.units} units)
            </li>
          ))}
        </ul>
        {extraCourses.length > 3 && (
          <button
            className="text-blue-500 text-sm mt-2 focus:outline-none"
            onClick={() => setShowAllExtra(!showAllExtra)}
            aria-expanded={showAllExtra}
            aria-label={showAllExtra ? "Show fewer extra courses" : "Show more extra courses"}
          >
            {showAllExtra ? "Show Less" : "Show More"}
          </button>
        )}
      </div>
    );
  };

  // Compute GE units (courses that have GE info).
  const geUnits = scheduledCourses
    .filter((course) => course.generalEd && course.generalEd.length > 0)
    .reduce((sum, course) => sum + course.units, 0);

  // Compute major units from courses used in majorStatus.
  const majorUnits = Object.values(majorStatus).reduce((sum, category) => {
    return sum + category.courses.reduce((s, course) => s + course.units, 0);
  }, 0);

  // Extra units: sum from extraCourses.
  const extraUnits = extraCourses.reduce((sum, course) => sum + course.units, 0);

  return (
    <div className="h-full p-1 overflow-auto">
      <h2 className="text-xl font-semibold mb-4">Courses Taken</h2>
      <div className="w-5/6 mx-auto mb-6">
      <div className="flex justify-center">
        <SegmentedProgressBar
          geUnits={geUnits}
          majorUnits={majorUnits}
          extraUnits={extraUnits}
          total={180}
        />
      </div>
        <p className="text-center text-sm mt-2">{`${totalUnits} / 180 Units Completed`}</p>
      </div>

      {/* GE Requirements Card */}
      <CollapsibleCard title="GE Courses">
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
                    {genEdFulfilled[area]?.count || 0}/{genEdFulfilled[area]?.required || 0} 
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
                    {genEdFulfilled[area]?.count || 0}/{genEdFulfilled[area]?.required || 0}
                  </span>
                </div>
                {renderGECourseList(area)}
              </li>
            ))}
          </ul>
        </div>
      </CollapsibleCard>

      {/* Major Requirements Card */}
      <CollapsibleCard title={`Major Courses`}>
        <div role="region" aria-label="Major Courses">
          {/* Lower Division Section */}
          <div>
            <h4 className="text-md font-semibold">Lower Division</h4>
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
                    <span>Preparation</span>
                  </div>
                  <span className="text-sm text-gray-600">
                    {majorStatus.preparation?.count || 0}/{majorStatus.preparation?.required || 0}
                  </span>
                </div>
                {renderMajorCourseList("preparation", majorStatus.preparation?.courses || [])}
              </li>
            </ul>
          </div>

          {/* Upper Division Section */}
          <div className="mt-4">
            <h4 className="text-md font-semibold">Upper Division</h4>
            <ul className="list-none space-y-2 ml-4">
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
                    <span>Required</span>
                  </div>
                  <span className="text-sm text-gray-600">
                    {majorStatus.upperRequired?.count || 0}/{majorStatus.upperRequired?.required || 0}
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
                    <span>Electives</span>
                  </div>
                  <span className="text-sm text-gray-600">
                    {majorStatus.upperElectives?.count || 0}/{majorStatus.upperElectives?.required || 0}
                  </span>
                </div>
                {renderMajorCourseList("upperElectives", majorStatus.upperElectives?.courses || [])}
              </li>
            </ul>
          </div>
        </div>
      </CollapsibleCard>


      {/* Extra Courses Card */}
      <CollapsibleCard title="Extra Courses">
        <div role="region" aria-label="Extra Courses">
          {renderExtraCoursesList()}
        </div>
      </CollapsibleCard>
    </div>
  );
};

export default ProgressTracker;
