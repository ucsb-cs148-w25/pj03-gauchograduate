'use client';

import { useSession } from "next-auth/react";
import { useRouter } from "next/router";
import { useEffect } from "react";
import CourseCatalog from "../app/components/CourseCatalog";
import FourYearPlan from "../app/components/four-year-plan";
import Navbar from "../app/components/Navbar";

export default function HomePage() {
  const { data: session, status } = useSession();
  const router = useRouter();

  useEffect(() => {
    if (status === "unauthenticated") {
      router.push("/signin");
    }
  }, [status, router]);

  if (status === "loading") {
    return <div>Loading...</div>;
  }

  if (!session) {
    return null;
  }

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />

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
