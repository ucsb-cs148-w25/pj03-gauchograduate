import { Course, ScheduleType } from "../coursetypes";

export interface GERequirement {
  fulfilled: boolean;
  count: number;
  required: number;
  courses: Course[];
}

/**
 * Computes GE requirements based on the student's schedule.
 */
export function computeGERequirements(
  studentSchedule: ScheduleType,
  college: string
): { [req: string]: GERequirement } {
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
      "NWC": 1,
    },
    "L&S": {},
  };

  const scheduledCourses = Object.values(studentSchedule)
    .flatMap((terms) => Object.values(terms).flat());

  const areaCounts: { [area: string]: number } = {};
  const areaCourses: { [area: string]: Course[] } = {};
  const requirements = collegeRequirements[college] || {};

  Object.keys(requirements).forEach((area) => {
    areaCounts[area] = 0;
    areaCourses[area] = [];
  });

  // The API returns "ENGR" for CoE courses
  const collegeFromAPI = college === "CoE" ? "ENGR" : college;

  scheduledCourses.forEach((course) => {
    if (course.generalEd && course.generalEd.length > 0) {
      course.generalEd.forEach((geItem) => {
        if (
          typeof geItem === "object" &&
          geItem !== null &&
          "geCode" in geItem &&
          "geCollege" in geItem
        ) {
          const { geCode, geCollege } = geItem as { geCode: string; geCollege: string };
          if (geCollege.trim() === collegeFromAPI) {
            const trimmedCode = geCode.trim();
            if (trimmedCode in requirements) {
              areaCounts[trimmedCode]++;
              areaCourses[trimmedCode].push(course);
            }
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
      courses: areaCourses[area],
    };
  });

  return geStatus;
}
