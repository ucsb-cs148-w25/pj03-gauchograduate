import { Term } from '../coursetypes';

export function getAcademicYear(quarterCode: string, yearOffset: number = 0): string {
  const year = parseInt(quarterCode.substring(0, 4));
  const shortYear = (year + yearOffset).toString().slice(2);
  const nextYear = ((year + yearOffset + 1) % 100).toString().padStart(2, '0');
  return `'${shortYear}-'${nextYear}`;
}

export function getCurrentQuarter(): { quarter: Term; academicYear: string } {
  const now = new Date();
  const year = now.getFullYear();
  
  // Define quarter date ranges (from 2024-2025 schedule for right now)
  const fallStart = new Date(year, 8, 22);  // Sep 22
  const winterStart = new Date(year, 0, 6); // Jan 6
  const springStart = new Date(year, 2, 31); // Mar 31
  const summerStart = new Date(year, 5, 23); // Jun 23

  let quarter: Term;
  let academicYear: string;

  if (now >= fallStart || now < winterStart) {
    quarter = 'Fall';
    academicYear = now >= fallStart ? `'${year.toString().slice(2)}-'${(year + 1).toString().slice(2)}` 
                                  : `'${(year - 1).toString().slice(2)}-'${year.toString().slice(2)}`;
  } else if (now >= winterStart && now < springStart) {
    quarter = 'Winter';
    academicYear = `'${(year - 1).toString().slice(2)}-'${year.toString().slice(2)}`;
  } else if (now >= springStart && now < summerStart) {
    quarter = 'Spring';
    academicYear = `'${(year - 1).toString().slice(2)}-'${year.toString().slice(2)}`;
  } else {
    quarter = 'Summer';
    academicYear = `'${(year - 1).toString().slice(2)}-'${year.toString().slice(2)}`;
  }

  return { quarter, academicYear };
}

export function isQuarterInPast(yearDisplay: string, term: Term): boolean {
  const current = getCurrentQuarter();
  const currentYear = parseInt(current.academicYear.slice(1, 3));
  const yearToCheck = parseInt(yearDisplay.slice(1, 3));

  if (yearToCheck < currentYear) return true;
  if (yearToCheck > currentYear) return false;

  // If in same year, check quarters
  const quarterOrder: Record<Term, number> = { 'Fall': 0, 'Winter': 1, 'Spring': 2, 'Summer': 3 };
  return quarterOrder[term] < quarterOrder[current.quarter];
}

export function isCurrentQuarter(yearDisplay: string, term: Term): boolean {
  const current = getCurrentQuarter();
  return yearDisplay === current.academicYear && term === current.quarter;
}
