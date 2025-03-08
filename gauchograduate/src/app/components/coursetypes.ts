export const Terms = ['Fall', 'Winter', 'Spring', 'Summer'];
export const Years = ['Year 1', 'Year 2', 'Year 3', 'Year 4'];

export type Term = typeof Terms[number];
export type YearType = typeof Years[number];
export type GeneralEd = {
  geCode: string;
  geCollege: string;
};

// Types for the complex prerequisites structure
export type PrerequisiteNode =
  | {
      // A single course requirement
      type: "course";
      id: string;                // e.g. "ANTH 3"
      minGrade: string | null;   // e.g. "C-", or null
      canTakeConcurrently: boolean;
    }
  | {
      // A special requirement (like AP exam scores)
      type: "specialRequirement";
      requirement: string;       // e.g. "Taken Exam: AP 85 with a score of 3"
    }
  | {
      // A logical operator node, either AND or OR
      type: "and" | "or";
      requirements: PrerequisiteNode[];
    };

// Interface for course data as it comes from the database
export interface CourseInfo {
  gold_id: string;
  title: string;
  description: string;
  subject_area: string;
  units: number | null;
  general_ed: GeneralEd[];
  prerequisites: PrerequisiteNode | null;
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
  prerequisites: PrerequisiteNode | null;
  unlocks: string[];
  term: Term[];
  grade?: string | null;
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
  onGradeChange: (grade: string | null) => void;
}

export interface FourYearPlanProps {
  selectedYear: YearType;
  setSelectedYear: React.Dispatch<React.SetStateAction<YearType>>;
  studentSchedule: ScheduleType;
  addCourse: (course: Course, term: Term) => void;
  removeCourse: (course: Course, term: Term) => void;
  reorderCourse: (year: YearType, term: Term, newCourses: Course[]) => void;
  isDataLoading: boolean;
  updateCourseGrade: (year: YearType, term: Term, courseId: string, grade: string | null) => void;
  saveStatus: 'idle' | 'saving' | 'saved';
  setSaveStatus: (status: 'idle' | 'saving' | 'saved') => void;
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
