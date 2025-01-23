'use client';

export default function HomePage() {
  return (
    <div className="min-h-screen flex flex-col">
      {/* Nav Bar */}
      <nav className="p-5 bg-[var(--background)] border-b border-gray-300">
        <h1 className="text-2xl font-bold">GauchoGraduate</h1>
      </nav>


      <div className="flex flex-1">
        {/* Course Catalog */}
        <div className="w-1/4 bg-[var(--off-white)]  p-4">
          <h2 className="text-xl font-semibold">Course Catalog</h2>
        </div>

        {/* 4-year calendar */}
        <div className="w-2/4 bg-white p-4 rounded-md shadow">
          <h2 className="text-xl font-semibold">Four Year Calendar</h2>
        </div>

        {/* Graduation Progress */}
        <div className="w-1/4 bg-[var(--off-white)] p-4">
          <h2 className="text-xl font-semibold">Progress Tracker</h2>
        </div>
      </div>
    </div>
  );
}

