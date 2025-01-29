'use client';

import { useState } from "react";
import CourseCatalog from "../app/components/CourseCatalog";
import FourYearPlan from "../app/components/four-year-plan";
import Navbar from "../app/components/Navbar";

export default function TestPage() {

    const defaultSchedule = {
        "Year 1": { Fall: [], Winter: [], Spring: [], Summer: [] },
        "Year 2": { Fall: [], Winter: [], Spring: [], Summer: [] },
        "Year 3": { Fall: [], Winter: [], Spring: [], Summer: [] },
        "Year 4": { Fall: [], Winter: [], Spring: [], Summer: [] },
    };

    const [studentSchedule, setStudentSchedule] = useState(defaultSchedule);
    const [selectedYear, setSelectedYear] = useState("Year 1");

    return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <div className="flex flex-1">
        {/* Course Catalog */}
        <CourseCatalog />

        {/* 4-year calendar */}
        <div className="w-2/4 bg-white p-4 rounded-md shadow">
          <FourYearPlan selectedYear={selectedYear} setSelectedYear={setSelectedYear} />
        </div>

        {/* Graduation Progress */}
        <div className="w-1/4 bg-[var(--off-white)] p-4">
          <h2 className="text-xl font-semibold">Progress Tracker</h2>
        </div>
      </div>
    </div>
  );
}
