import { useEffect, useState } from "react";
import "react-circular-progressbar/dist/styles.css";
import { Course, MajorData, ScheduleType } from "./coursetypes";
import { computeGERequirements, GERequirement } from "./requirements/GEReqs";
import { computeMajorRequirements } from "./requirements/COREReqs";
import SegmentedProgressBar from "./progress_components/SegmentedProgressBar";
import CollapsibleCard from "./progress_components/CollapsibleCard";
import GEOverridePopup from "./progress_components/GEOverridePopup";
import MajorOverridePopup from "./progress_components/MajorOverridePopups"; // <-- NEW POPUP
import { MajorOverride } from "@/types/next-auth";

interface ProgressTrackerProps {
  studentSchedule: ScheduleType;
  college?: string;
  saveStatus: 'idle' | 'saving' | 'saved';
  setSaveStatus: (status: 'idle' | 'saving' | 'saved') => void;
}

const ProgressTracker = ({
  studentSchedule,
  college = "CoE",
  setSaveStatus
}: ProgressTrackerProps) => {
  const [totalUnits, setTotalUnits] = useState<number>(0);
  const [scheduledCourses, setScheduledCourses] = useState<Course[]>([]);
  const [externalUnits, setExternalUnits] = useState<number>(0);
  const [isAddingOverride, setIsAddingOverride] = useState<boolean>(false);

  // GE requirements state
  const [genEdFulfilled, setGenEdFulfilled] = useState<{ [req: string]: GERequirement }>({});
  const [expandedAreas, setExpandedAreas] = useState<{ [area: string]: boolean }>({});
  const [overridePopupArea, setOverridePopupArea] = useState<string | null>(null);
  const [overrides, setOverrides] = useState<MajorOverride[]>([]);

  // Major requirements state
  const [majorData, setMajorData] = useState<MajorData | null>(null);
  const [majorStatus, setMajorStatus] = useState<{ [key: string]: GERequirement }>({});
  const [expandedMajorAreas, setExpandedMajorAreas] = useState<{ [area: string]: boolean }>({});
  const [majorCourses, setMajorCourses] = useState<{
    preparation: Course[];
    upperRequired: Course[];
    upperElectives: Course[];
  }>({
    preparation: [],
    upperRequired: [],
    upperElectives: []
  });

  // MAJOR OVERRIDE POPUP state
  const [overridePopupCourse, setOverridePopupCourse] = useState<Course | null>(null);

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

  // Calculate external units from overrides
  const calculateExternalUnits = (overridesList: MajorOverride[]) => {
    return overridesList.reduce((sum: number, override: MajorOverride) => {
      if (override.type === 'unit') {
        // This is the old 'unit' override type (e.g. "12 units from ???")
        return sum + (parseInt(override.requirement) || 0);
      } else if (override.units) {
        // For both 'ge' and 'major' overrides that include .units
        return sum + override.units;
      }
      return sum;
    }, 0);
  };

  // Fetch user courses and overrides
  useEffect(() => {
    fetch("/api/user/courses")
      .then((res) => res.json())
      .then((data) => {
        if (data && data.overrides) {
          setOverrides(data.overrides);

          // Calculate external units from unit-type overrides
          const totalExternalUnits = calculateExternalUnits(data.overrides);
          setExternalUnits(totalExternalUnits);
        }
      })
      .catch((err) => console.error("Error fetching user courses:", err));
  }, []);

  // Compute GE requirements.
  useEffect(() => {
    const geStatus = computeGERequirements(studentSchedule, college);

    // Apply GE overrides
    const updatedGeStatus = { ...geStatus };

    // Count overrides per requirement area
    const overrideCountByArea: { [area: string]: number } = {};

    // First pass: count all overrides by area
    overrides.forEach(override => {
      if (override.type === 'ge' && override.requirement in updatedGeStatus) {
        if (!overrideCountByArea[override.requirement]) {
          overrideCountByArea[override.requirement] = 0;
        }
        overrideCountByArea[override.requirement]++;
      }
    });

    // Second pass: update requirements with the total count of overrides
    Object.entries(overrideCountByArea).forEach(([area, count]) => {
      if (area in updatedGeStatus) {
        const baseCount = updatedGeStatus[area].count;
        const requiredCount = updatedGeStatus[area].required;
        updatedGeStatus[area] = {
          ...updatedGeStatus[area],
          count: baseCount + count,
          fulfilled: (baseCount + count) >= requiredCount
        };
      }
    });

    setGenEdFulfilled(updatedGeStatus);
  }, [studentSchedule, college, overrides]);

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

  // getting course details for major requirements
  useEffect(() => {
    if (!majorData) return;
  
    const courseIds = [
      ...majorData.requirements.preparation.and,
      ...majorData.requirements.upper_division.required.and,
      ...majorData.requirements.upper_division.electives.or.classes,
    ];
  
    // Filter to include only numeric course IDs
    const numericCourseIds = courseIds
      .filter((id) => /^\d+$/.test(id)) // Keep only numeric IDs
      .map(Number); // Convert to numbers
  
    if (numericCourseIds.length === 0) {
      console.log("No numeric course IDs found for batch request.");
      return;
    }
  
    console.log("Sending batch request with courseIds:", numericCourseIds);
  
    fetch("/api/course/query/batch", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ courseIds: numericCourseIds }),
    })
      .then((res) => res.json())
      .then((data) => {
        console.log("Batch request response data:", data);
  
        if (!data || !Array.isArray(data.courses)) {
          console.warn("Batch request did not return an expected array of courses.");
          return;
        }
  
        const coursesByCategory = {
          preparation: [] as Course[],
          upperRequired: [] as Course[],
          upperElectives: [] as Course[],
        };
  
        data.courses.forEach((course: Course) => {
          const courseId = String(course.id);
  
          if (majorData.requirements.preparation.and.includes(courseId)) {
            coursesByCategory.preparation.push(course);
          }
          if (majorData.requirements.upper_division.required.and.includes(courseId)) {
            coursesByCategory.upperRequired.push(course);
          }
          if (majorData.requirements.upper_division.electives.or.classes.includes(courseId)) {
            coursesByCategory.upperElectives.push(course);
          }
        });
  
        // Sort each category alphabetically by gold_id
        coursesByCategory.preparation.sort((a, b) => a.gold_id.localeCompare(b.gold_id));
        coursesByCategory.upperRequired.sort((a, b) => a.gold_id.localeCompare(b.gold_id));
        coursesByCategory.upperElectives.sort((a, b) => a.gold_id.localeCompare(b.gold_id));
  
        setMajorCourses(coursesByCategory);
      })
      .catch((err) => console.error("Error fetching major requirement courses:", err));
  }, [majorData]);  
  
  // Compute extra courses: core courses not used for major requirements.
  useEffect(() => {
    const coreCourses = scheduledCourses.filter((course) => course.generalEd.length === 0);
    const usedCourseIds = new Set<string>();
    Object.values(majorStatus).forEach((category) => {
      category.courses.forEach((course) => usedCourseIds.add(String(course.id)));
    });
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

  // ========== GE OVERRIDE HANDLERS (unchanged) ==========
  const handleCheckboxClick = (area: string, fulfilled: boolean) => {
    if (!fulfilled) {
      setOverridePopupArea(area);
    }
  };

  const handleOverrideConfirm = async (area: string, creditType: string, units: number) => {
    if (isAddingOverride) return;

    setIsAddingOverride(true);

    const geOverride: MajorOverride = {
      type: 'ge',
      requirement: area,
      creditSource: creditType,
      units
    };

    const updatedOverrides = [...overrides, geOverride];
    setOverrides(updatedOverrides);
    setExternalUnits(calculateExternalUnits(updatedOverrides));
    setOverridePopupArea(null);

    setSaveStatus('saving');

    try {
      const response = await fetch('/api/user/add-override', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ override: geOverride }),
      });
      if (!response.ok) {
        throw new Error('Failed to add GE override');
      }
      const data = await response.json();
      setOverrides(data.overrides);
      setSaveStatus('saved');
    } catch (error) {
      console.error('Error in override process:', error);
      alert('Failed to add override. Please try again.');
      setOverrides(overrides);
      setExternalUnits(calculateExternalUnits(overrides));
      setSaveStatus('idle');
    } finally {
      setIsAddingOverride(false);
    }
  };

  const handleRemoveOverride = async (area: string) => {
    const overridesToRemove = overrides.filter(o => o.type === 'ge' && o.requirement === area);
    if (!overridesToRemove.length) return;

    const overrideToRemove = overridesToRemove[overridesToRemove.length - 1];
    const updatedOverrides = overrides.filter(o => o !== overrideToRemove);
    setOverrides(updatedOverrides);
    setExternalUnits(calculateExternalUnits(updatedOverrides));
    setSaveStatus('saving');

    try {
      const response = await fetch('/api/user/remove-override', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ override: overrideToRemove }),
      });
      if (!response.ok) {
        throw new Error('Failed to remove override');
      }
      const data = await response.json();
      setOverrides(data.overrides);
      setSaveStatus('saved');
    } catch (error) {
      console.error('Error removing override:', error);
      alert('Failed to remove override. Please try again.');
      setOverrides(overrides);
      setExternalUnits(calculateExternalUnits(overrides));
      setSaveStatus('idle');
    }
  };
  // =======================================================

  // ========== MAJOR OVERRIDE HANDLERS (NEW) ==========
  const handleMajorCourseCheckboxClick = (course: Course, isFulfilled: boolean) => {
    // If it's NOT fulfilled (no schedule completion & no override),
    // then show popup to add a major override.
    if (!isFulfilled) {
      setOverridePopupCourse(course);
    }
    // If it IS fulfilled (by schedule or override), do nothing.
    // Removing the override is done via the "blue text remove" link.
  };

  // Called after user hits "Confirm" in the major override popup
  const handleMajorOverrideConfirm = async (course: Course, creditType: string, units: number) => {
    if (isAddingOverride) return;
    setIsAddingOverride(true);

    const newOverride: MajorOverride = {
      type: 'major',
      requirement: 'specific-course',
      courseId: course.id,
      // courseName: course.gold_id,
      creditSource: creditType,
      units
    };

    const updatedOverrides = [...overrides, newOverride];
    setOverrides(updatedOverrides);
    setExternalUnits(calculateExternalUnits(updatedOverrides));
    setOverridePopupCourse(null);
    setSaveStatus('saving');

    try {
      const response = await fetch('/api/user/add-override', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ override: newOverride }),
      });
      if (!response.ok) {
        throw new Error('Failed to add major override');
      }
      const data = await response.json();
      setOverrides(data.overrides);
      setSaveStatus('saved');
    } catch (error) {
      console.error('Error adding major override:', error);
      alert('Failed to add override. Please try again.');
      setOverrides(overrides);
      setExternalUnits(calculateExternalUnits(overrides));
      setSaveStatus('idle');
    } finally {
      setIsAddingOverride(false);
    }
  };

  // "Remove" link next to the override message
  const handleRemoveMajorOverride = async (course: Course) => {
    // We only expect 1 override per course, but just in case:
    const overrideToRemove = overrides.find(
      (o) => o.type === 'major' && o.requirement === 'specific-course' && o.courseId === course.id
    );
    if (!overrideToRemove) return;

    const updatedOverrides = overrides.filter(o => o !== overrideToRemove);
    setOverrides(updatedOverrides);
    setExternalUnits(calculateExternalUnits(updatedOverrides));
    setSaveStatus('saving');

    try {
      const response = await fetch('/api/user/remove-override', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ override: overrideToRemove }),
      });
      if (!response.ok) {
        throw new Error('Failed to remove major override');
      }
      const data = await response.json();
      setOverrides(data.overrides);
      setSaveStatus('saved');
    } catch (error) {
      console.error('Error removing major override:', error);
      alert('Failed to remove override. Please try again.');
      setOverrides(overrides);
      setExternalUnits(calculateExternalUnits(overrides));
      setSaveStatus('idle');
    }
  };
  // ====================================================

  const renderGECourseList = (area: string) => {
    const courses = genEdFulfilled[area]?.courses || [];
    const isExpanded = expandedAreas[area] || false;
    const itemsToShow = isExpanded ? courses : courses.slice(0, 1);

    // Count overrides for this area
    const areaOverrides = overrides.filter(o => o.type === 'ge' && o.requirement === area);
    const overrideCount = areaOverrides.length;
    const hasOverride = overrideCount > 0;

    return (
      <div className="ml-8 mt-1">
        {hasOverride && (
          <div className="flex items-center text-sm text-blue-600 mb-1">
            <span>{overrideCount} course override applied</span>
            <button
              onClick={() => handleRemoveOverride(area)}
              className="ml-2 text-red-500 text-xs hover:underline"
              aria-label={`Remove ${area} override`}
              disabled={isAddingOverride}
            >
              (Remove)
            </button>
          </div>
        )}

        {courses.length > 0 && (
          <>
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
          </>
        )}
      </div>
    );
  };

  // Render list of major courses in each category
  const renderMajorCourseList = (area: string, courses: Course[] = []) => {
    const isExpanded = expandedMajorAreas[area] || false;
    const itemsToShow = isExpanded ? courses : courses.slice(0, 3);

    if (courses.length === 0) {
      return <p className="text-sm text-gray-500">No courses found.</p>;
    }

    return (
      <div className="ml-4 mt-1">
        <ul className="list-none space-y-1 break-words text-md">
          {itemsToShow.map((course) => {
            // Check if this course is in the schedule
            const isCompletedInSchedule = majorStatus[area]?.courses.some((c) => c.id === course.id);

            // Check if overridden
            const overrideForThisCourse = overrides.find(
              (o) =>
                o.type === 'major' &&
                o.requirement === 'specific-course' &&
                o.courseId === course.id
            );
            const isOverridden = !!overrideForThisCourse;

            // If either isOverridden or isCompletedInSchedule => "fulfilled"
            const isFulfilled = isCompletedInSchedule || isOverridden;

            return (
              <li key={course.id} className="mb-2">
                <div className="flex items-center">
                  {/* SINGLE CHECKBOX for both schedule or override. */}
                  <input
                    type="checkbox"
                    readOnly
                    checked={isFulfilled}
                    className="mr-2 cursor-pointer"
                    onClick={() => handleMajorCourseCheckboxClick(course, isFulfilled)}
                    title="Click if you have external credit for this course"
                  />
                  <span>
                    {course.gold_id} ({course.units} units)
                  </span>
                </div>
                {/* If overridden, show a small message (blue) + remove link */}
                {isOverridden && (
                  <div className="ml-6 text-sm text-blue-600">
                    <span> Overriden ({overrideForThisCourse.creditSource}) </span>
                    <button
                      onClick={() => handleRemoveMajorOverride(course)}
                      className="ml-2 text-red-500 text-xs hover:underline"
                      disabled={isAddingOverride}
                    >
                      (Remove)
                    </button>
                  </div>
                )}
              </li>
            );
          })}
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
    if (extraCourses.length === 0) {
      return <p className="ml-5 text-sm text-gray-500">No extra courses taken.</p>;
    }
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

  // Compute GE units
  const geUnits = scheduledCourses
    .filter((course) => course.generalEd && course.generalEd.length > 0)
    .reduce((sum, course) => sum + course.units, 0);

  // Compute major units
  const majorUnits = Object.values(majorStatus).reduce((sum, category) => {
    return sum + category.courses.reduce((s, course) => s + course.units, 0);
  }, 0);

  // Extra units
  const extraUnits = extraCourses.reduce((sum, course) => sum + course.units, 0);

  // Calculate GPA
  const calculateGPA = () => {
    const gradePoints: { [key: string]: number } = {
      'A+': 4.0, 'A': 4.0, 'A-': 3.7,
      'B+': 3.3, 'B': 3.0, 'B-': 2.7,
      'C+': 2.3, 'C': 2.0, 'C-': 1.7,
      'D+': 1.3, 'D': 1.0, 'D-': 0.7,
      'F': 0.0
    };
    const gradedCourses = scheduledCourses.filter(
      (course) => course.grade && course.grade in gradePoints
    );
    if (gradedCourses.length === 0) return null;

    let totalGradePoints = 0;
    let totalGradedUnits = 0;
    gradedCourses.forEach((course) => {
      if (course.grade && course.grade in gradePoints) {
        totalGradePoints += gradePoints[course.grade] * course.units;
        totalGradedUnits += course.units;
      }
    });
    return totalGradedUnits > 0 ? (totalGradePoints / totalGradedUnits).toFixed(2) : null;
  };
  const gpa = calculateGPA();

  // Render a legend
  const renderProgressLegend = () => {
    return (
      <div className="flex flex-wrap justify-center mt-2 text-xs gap-2">
        <div className="flex items-center">
          <div className="w-3 h-3 bg-[#ffb6c1] mr-1 rounded-sm"></div>
          <span>GE</span>
        </div>
        <div className="flex items-center">
          <div className="w-3 h-3 bg-[#ffcc99] mr-1 rounded-sm"></div>
          <span>Major</span>
        </div>
        <div className="flex items-center">
          <div className="w-3 h-3 bg-[#add8e6] mr-1 rounded-sm"></div>
          <span>Extra</span>
        </div>
        <div className="flex items-center">
          <div className="w-3 h-3 bg-[#d3d3d3] mr-1 rounded-sm"></div>
          <span>External</span>
        </div>
      </div>
    );
  };

  // Add this function before the return statement in your component
  const countMajorOverridesForCategory = (category: 'preparation' | 'upperRequired' | 'upperElectives') => {
    const relevantCourses = majorCourses[category] || [];
    return relevantCourses.reduce((count, course) => {
      const hasOverride = overrides.some(
        o => o.type === 'major' && 
             o.requirement === 'specific-course' && 
             o.courseId === course.id
      );
      return count + (hasOverride ? 1 : 0);
    }, 0);
  };

  return (
    <div className="h-full p-1 overflow-auto">
      <h2 className="text-xl font-semibold mb-4">Courses Taken</h2>
      <div className="w-5/6 mx-auto mb-6">
        <div className="flex justify-center">
          <SegmentedProgressBar
            geUnits={geUnits}
            majorUnits={majorUnits}
            extraUnits={extraUnits}
            externalUnits={externalUnits}
            total={180}
          />
        </div>
        <p className="text-center text-sm mt-2">
          {`${totalUnits + externalUnits} / 180 Units Completed`}
          {gpa && ` • GPA: ${gpa}`}
        </p>
        {renderProgressLegend()}
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
                      className="mr-2 cursor-pointer"
                      aria-label={`${area} requirement fulfilled`}
                      onClick={() => handleCheckboxClick(area, !!genEdFulfilled[area]?.fulfilled)}
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
                      className="mr-2 cursor-pointer"
                      aria-label={`${area} requirement fulfilled`}
                      onClick={() => handleCheckboxClick(area, !!genEdFulfilled[area]?.fulfilled)}
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
            <h4 className="text-md font-semibold">
              Preparation {majorStatus.preparation?.count + countMajorOverridesForCategory('preparation') || 0}/{majorStatus.preparation?.required || 0}
            </h4>
            {renderMajorCourseList("preparation", majorCourses.preparation)}
          </div>

          {/* Upper Division Section */}
          <div className="mt-4">
            <h4 className="text-md font-semibold">
              Required {majorStatus.upperRequired?.count + countMajorOverridesForCategory('upperRequired') || 0}/{majorStatus.upperRequired?.required || 0}
            </h4>
            {renderMajorCourseList("upperRequired", majorCourses.upperRequired)}
          </div>

          {/* Electives Section */}
          <div className="mt-4">
            <h4 className="text-md font-semibold">
              Electives {majorStatus.upperElectives?.count + countMajorOverridesForCategory('upperElectives') || 0}/{majorStatus.upperElectives?.required || 0}
            </h4>
            {renderMajorCourseList("upperElectives", majorCourses.upperElectives)}
          </div>
        </div>
      </CollapsibleCard>

      {/* Extra Courses Card */}
      <CollapsibleCard title="Extra Courses">
        <div role="region" aria-label="Extra Courses">
          {renderExtraCoursesList()}
        </div>
      </CollapsibleCard>

      {/* External Units Card */}
      <CollapsibleCard title="External Units">
        <div role="region" aria-label="External Units">
          <p className="ml-5 text-sm">
            {externalUnits > 0
              ? `${externalUnits} units from courses taken outside UCSB`
              : "No external units recorded."}
          </p>
        </div>
      </CollapsibleCard>

      {/* GE Override Popup (unchanged) */}
      {overridePopupArea && (
        <GEOverridePopup
          area={overridePopupArea}
          onClose={() => setOverridePopupArea(null)}
          onConfirm={handleOverrideConfirm}
        />
      )}

      {/* MAJOR Override Popup (NEW) */}
      {overridePopupCourse && (
        <MajorOverridePopup
          course={overridePopupCourse}
          onClose={() => setOverridePopupCourse(null)}
          onConfirm={handleMajorOverrideConfirm}
        />
      )}
    </div>
  );
};

export default ProgressTracker;
