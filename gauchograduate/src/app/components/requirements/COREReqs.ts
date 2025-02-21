import { Course, MajorData, ScheduleType } from "../coursetypes";
import { GERequirement } from "./GEReqs";

/**
 * Computes major requirements based on the student's schedule, courses, and fetched major data.
 * Uses the internal course id (course.id) for comparisons.
 */
export function computeMajorRequirements(
  studentSchedule: ScheduleType,
  courses: Course[],
  majorData: MajorData
): { [key: string]: GERequirement } {
  // Extract completed courses based on the student's schedule using internal id.
  const scheduledCourseIds = Object.values(studentSchedule)
    .flatMap((terms) => Object.values(terms).flat())
    .map((course) => String(course.id)); // Normalize to string

  const completedCourses = courses.filter((course) =>
    scheduledCourseIds.includes(String(course.id))
  );
  console.log("Completed courses (using internal id):", completedCourses);

  const majorReq = majorData.requirements;
  console.log("Major requirements:", majorReq);
  
  const newMajorStatus: { [key: string]: GERequirement } = {};

  // Lower Division (Preparation) – "and" requirement.
  const prepReqs: string[] = (majorReq.preparation?.and || []).filter((id: string) =>
    /^[0-9]+$/.test(id)
  );
  console.log("Lower Division (prep) requirement IDs:", prepReqs);

  const prepCourses = prepReqs
    .map((reqId) => completedCourses.find((course) => String(course.id) === reqId))
    .filter((course): course is Course => course !== undefined);
  newMajorStatus.preparation = {
    fulfilled: prepCourses.length === prepReqs.length,
    count: prepCourses.length,
    required: prepReqs.length,
    courses: prepCourses,
  };
  console.log("Lower Division (prep) status:", newMajorStatus.preparation);

  // Upper Division (Required) – "and" requirement.
  const upperRequiredReqs: string[] = (majorReq.upper_division?.required?.and || []).filter(
    (id: string) => /^[0-9]+$/.test(id)
  );
  console.log("Upper Division (required) requirement IDs:", upperRequiredReqs);

  const upperRequiredCourses = upperRequiredReqs
    .map((reqId) => completedCourses.find((course) => String(course.id) === reqId))
    .filter((course): course is Course => course !== undefined);
  newMajorStatus.upperRequired = {
    fulfilled: upperRequiredCourses.length === upperRequiredReqs.length,
    count: upperRequiredCourses.length,
    required: upperRequiredReqs.length,
    courses: upperRequiredCourses,
  };
  console.log("Upper Division (required) status:", newMajorStatus.upperRequired);

  // Upper Division (Electives) – "or" requirement.
  const electivesData = majorReq.upper_division?.electives?.or;
  const electiveReqCount = electivesData?.count || 0;
  const electiveReqs: string[] = (electivesData?.classes || []).filter((id: string) =>
    /^[0-9]+$/.test(id)
  );
  console.log("Elective requirement IDs (filtered):", electiveReqs);
  
  const electiveCourses = completedCourses.filter((course) =>
    electiveReqs.includes(String(course.id))
  );
  newMajorStatus.upperElectives = {
    fulfilled: electiveCourses.length >= electiveReqCount,
    count: electiveCourses.length,
    required: electiveReqCount,
    courses: electiveCourses,
  };
  console.log("Upper Division (electives) status:", newMajorStatus.upperElectives);

  return newMajorStatus;
}
