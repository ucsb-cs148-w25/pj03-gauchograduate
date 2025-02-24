export const Terms = ['Fall', 'Winter', 'Spring', 'Summer'];
export const Years = ['Year 1', 'Year 2', 'Year 3', 'Year 4'];

export type Term = typeof Terms[number];
export type YearType = typeof Years[number];
export type GeneralEd = {
  geCode: string;
  geCollege: string;
};

// Interface for course data as it comes from the database
export interface CourseInfo {
  gold_id: string;
  title: string;
  description: string;
  subject_area: string;
  units: number | null;
  general_ed: GeneralEd[];
  prerequisites: number[];
  unlocks: number[];
  id: number;
}

// each course information for rendered courses in the frontend
export interface Course {
  gold_id: string;
  id: number;
  title: string;
  description: string;
  subjectArea: string;
  units: number;
  generalEd: GeneralEd[];
  prerequisites: string[];
  unlocks: string[];
  term: Term[];
}

// describing the student's entire 4-year schedule
export type ScheduleType = {
  [year in YearType]: {
    [t in Term]: Course[];
  };
};

// CoursePopup props
export interface CoursePopupProps {
  course: Course;
  term: Term;
  onClose: () => void;
  onDelete: () => void;
}

export interface FourYearPlanProps {
  selectedYear: YearType;
  setSelectedYear: React.Dispatch<React.SetStateAction<YearType>>;
  studentSchedule: ScheduleType;
  addCourse: (course: Course, term: Term) => void;
  removeCourse: (course: Course, term: Term) => void;
  reorderCourse: (year: YearType, term: Term, newCourses: Course[]) => void;
  isDataLoading: boolean;
}

export interface MajorRequirements {
  preparation: { and: string[] };
  upper_division: {
    required: { and: string[] };
    electives: { or: { count: number; notes: string[]; classes: string[] } };
  };
}

export interface MajorData {
  id: number;
  name: string;
  college: string;
  requirements: MajorRequirements;
}