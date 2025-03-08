import React from 'react';
import { ScheduleType, YearType, Term, Course } from './coursetypes';
import { useSession } from 'next-auth/react';
import { getAcademicYear } from './utils/quarterUtils';

interface PrintableScheduleProps {
  studentSchedule: ScheduleType;
  showSummer?: boolean;
}

const PrintableSchedule = React.forwardRef<HTMLDivElement, PrintableScheduleProps>(
  ({ studentSchedule, showSummer = true }, ref) => {
    const { data: session } = useSession();
    const firstQuarter = session?.user?.courses?.firstQuarter || '20224';
    const userName = session?.user?.name || 'Student';
    const userMajor = session?.user?.major?.name || '';

    const getYearDisplay = (year: YearType): string => {
      const yearIndex = ['Year 1', 'Year 2', 'Year 3', 'Year 4'].indexOf(year);
      return getAcademicYear(firstQuarter, yearIndex);
    };

    const displayTerms = ['Fall', 'Winter', 'Spring', ...(showSummer ? ['Summer'] : [])] as Term[];

    // Grade point mapping for GPA calculation
    const gradePoints: { [key: string]: number } = {
      'A+': 4.0, 'A': 4.0, 'A-': 3.7,
      'B+': 3.3, 'B': 3.0, 'B-': 2.7,
      'C+': 2.3, 'C': 2.0, 'C-': 1.7,
      'D+': 1.3, 'D': 1.0, 'D-': 0.7,
      'F': 0.0
    };

    // Calculate GPA for a specific list of courses
    const calculateGPA = (courses: Course[]): { gpa: string | null, totalUnits: number, totalPoints: number } => {
      // Filter courses that have letter grades (not P/NP)
      const gradedCourses = courses.filter(course =>
        course.grade && course.grade in gradePoints
      );

      if (gradedCourses.length === 0) return { gpa: null, totalUnits: 0, totalPoints: 0 };

      // Calculate total grade points and total units
      let totalGradePoints = 0;
      let totalGradedUnits = 0;

      gradedCourses.forEach(course => {
        if (course.grade && course.grade in gradePoints) {
          totalGradePoints += gradePoints[course.grade] * course.units;
          totalGradedUnits += course.units;
        }
      });

      const gpa = totalGradedUnits > 0 ? (totalGradePoints / totalGradedUnits).toFixed(2) : null;
      return {
        gpa,
        totalUnits: totalGradedUnits,
        totalPoints: totalGradePoints
      };
    };

    // Track cumulative GPA and units across all terms
    let cumulativeUnits = 0;
    let cumulativePoints = 0;
    let totalCumulativeUnits = 0; // For tracking total units across all terms (including non-graded)

    return (
      <div
        ref={ref}
        className="p-8 bg-white"
        style={{ fontFamily: 'Arial, sans-serif' }}
      >
        <div className="mb-8 text-center">
          <h1 className="text-2xl font-bold mb-2">Four-Year Academic Plan</h1>
          <p className="text-lg">{userName} - {userMajor}</p>
          <p className="text-sm text-gray-500">Generated on {new Date().toLocaleDateString()}</p>
        </div>

        {Object.keys(studentSchedule).map((year) => {
          // Reset cumulative GPA for each year if you want to track by year
          // If you want a running cumulative GPA across all years, move these outside the map function

          return (
            <div key={year} className="mb-8">
              <h2 className="text-xl font-semibold mb-4 pb-2 border-b-2 border-gray-300">
                {year} ({getYearDisplay(year as YearType)})
              </h2>

              <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                {displayTerms.map((term) => {
                  const courses = studentSchedule[year as YearType][term];
                  const quarterUnits = courses.reduce((sum, course) => sum + course.units, 0);

                  // Update total cumulative units (including non-graded)
                  totalCumulativeUnits += quarterUnits;

                  // Calculate term GPA
                  const { gpa: termGPA, totalUnits: termGradedUnits, totalPoints: termPoints } = calculateGPA(courses);

                  // Update cumulative totals for GPA calculation
                  cumulativeUnits += termGradedUnits;
                  cumulativePoints += termPoints;

                  // Calculate cumulative GPA
                  const cumulativeGPA = cumulativeUnits > 0
                    ? (cumulativePoints / cumulativeUnits).toFixed(2)
                    : null;

                  return (
                    <div key={term} className="mb-4">
                      <h3 className="text-lg font-medium mb-2">{term}</h3>

                      {courses.length > 0 ? (
                        <div>
                          <table className="w-full border-collapse">
                            <thead>
                              <tr className="bg-gray-100">
                                <th className="border border-gray-300 p-2 text-left">Course</th>
                                <th className="border border-gray-300 p-2 text-left">Title</th>
                                <th className="border border-gray-300 p-2 text-center">Units</th>
                                <th className="border border-gray-300 p-2 text-center">Grade</th>
                              </tr>
                            </thead>
                            <tbody>
                              {courses.map((course: Course) => (
                                <tr key={course.gold_id}>
                                  <td className="border border-gray-300 p-2 font-medium">{course.gold_id}</td>
                                  <td className="border border-gray-300 p-2">{course.title}</td>
                                  <td className="border border-gray-300 p-2 text-center">{course.units}</td>
                                  <td className="border border-gray-300 p-2 text-center">{course.grade || '-'}</td>
                                </tr>
                              ))}
                              {/* Quarter row */}
                              <tr className="bg-gray-50">
                                <td className="border border-gray-300 p-2 text-left font-medium">Quarter</td>
                                <td className="border border-gray-300 p-2 text-center">-</td>
                                <td className="border border-gray-300 p-2 text-center">{quarterUnits}</td>
                                <td className="border border-gray-300 p-2 text-center">{termGPA || '-'}</td>
                              </tr>
                              {/* Cumulative row */}
                              <tr className="bg-gray-50">
                                <td className="border border-gray-300 p-2 text-left font-medium">Cumulative</td>
                                <td className="border border-gray-300 p-2 text-center">-</td>
                                <td className="border border-gray-300 p-2 text-center">{totalCumulativeUnits}</td>
                                <td className="border border-gray-300 p-2 text-center">{cumulativeGPA || '-'}</td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      ) : (
                        <p className="text-gray-500 italic">No courses scheduled</p>
                      )}
                    </div>
                  );
                })}
              </div>
            </div>
          );
        })}

        <div className="mt-12 text-center text-xs text-gray-500">
          <p>This schedule is for planning purposes only and is subject to change.</p>
          <p>Generated by Gaucho Graduate - UCSB Academic Planning Tool</p>
        </div>
      </div>
    );
  }
);

PrintableSchedule.displayName = 'PrintableSchedule';

export default PrintableSchedule;