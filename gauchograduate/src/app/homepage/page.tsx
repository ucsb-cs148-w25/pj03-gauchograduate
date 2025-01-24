'use client';

import CourseCatalog from "../components/CourseCatalog";
import FourYearPlan from "../components/four-year-plan";

export default function HomePage() {
  return (
    <div className="min-h-screen flex flex-col">
      {/* Nav Bar */}
      <nav className="p-5 bg-[var(--background)] border-b border-gray-300">
        <h1 className="text-2xl font-bold">GauchoGraduate</h1>
      </nav>


      <div className="flex flex-1">
        {/* Course Catalog */}
        <CourseCatalog />

        {/* 4-year calendar */}
        <div className="w-2/4 bg-white p-4 rounded-md shadow">
          <FourYearPlan />
        </div>

        {/* Graduation Progress */}
        <div className="w-1/4 bg-[var(--off-white)] p-4">
          <h2 className="text-xl font-semibold">Progress Tracker</h2>
        </div>
      </div>
    </div>
  );
}

