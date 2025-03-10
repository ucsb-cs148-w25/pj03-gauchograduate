'use client';

import { useSession } from "next-auth/react";
import { useRouter } from "next/router";
import { useEffect } from "react";
import Navbar from "../app/components/Navbar";

export default function SimpleHomePage() {
  const { data: session, status } = useSession();
  const router = useRouter();

  useEffect(() => {
    if (status === "unauthenticated") {
      router.push("/signin");
    }
  }, [status, router]);

  if (status === "loading") {
    return (
      <div className="h-screen flex items-center justify-center">
        <div className="text-xl">Loading user session...</div>
      </div>
    );
  }

  return (
    <div className="h-screen flex flex-col">
      <Navbar />
      <div className="flex-1 flex items-center justify-center flex-col p-4">
        <h1 className="text-2xl font-bold mb-6">Welcome to GauchoGraduate</h1>
        
        <div className="bg-blue-100 p-6 rounded-lg max-w-md w-full">
          <h2 className="text-xl font-semibold mb-4">Current Status</h2>
          <p className="mb-3">
            You are currently signed in{session?.user?.name ? ` as ${session.user.name}` : ''}.
          </p>
          
          <p className="mb-4">
            We&apos;re having trouble loading your course data. Our team is working on fixing this issue.
          </p>
          
          <div className="flex flex-col gap-2">
            <button 
              onClick={() => window.location.reload()} 
              className="w-full py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 transition-colors"
            >
              Reload Page
            </button>
            
            <button 
              onClick={() => router.push('/update-profile')} 
              className="w-full py-2 bg-gray-200 text-gray-800 rounded-md hover:bg-gray-300 transition-colors"
            >
              Update Profile
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
