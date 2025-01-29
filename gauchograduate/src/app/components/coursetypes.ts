
export const Terms = ['Fall', 'Winter', 'Spring', 'Summer'];
export const Years = ['Year 1', 'Year 2', 'Year 3', 'Year 4'];

export type Term = typeof Terms[number];
export type YearType = typeof Years[number];

// each course information
export interface Course {
  course_id: string;
  title: string;
  description: string;
  subjectArea: string;
  units: number;
  generalEd: string;
  prerequisites: string[];
  unlocks: string[];
  department: string;
  term: Term[];
}

// describing the student’s entire 4-year schedule
export type ScheduleType = {
    [year in YearType]: {
      [t in Term]: Course[];
    };
  };