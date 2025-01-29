'use client';

import { useSession, signOut } from "next-auth/react";
import Link from 'next/link';

export default function Navbar() {
  const { data: session } = useSession();

  return (
    <nav className="p-5 bg-[var(--background)] border-b border-gray-300 flex justify-between items-center">
      <h1 className="text-2xl font-bold"><Link href="/">GauchoGraduate</Link></h1>
      <div className="text-sm flex items-center gap-4">
        {session?.user?.name && (
          <>
            <span>Logged in as {session.user.name.split(' ')[0]}</span>
            <button 
              onClick={() => signOut({ callbackUrl: '/signin' })}
              className="px-3 py-1 bg-red-500 text-white rounded-md hover:bg-red-600 transition-colors"
            >
              Log out
            </button>
          </>
        )}
      </div>
    </nav>
  );
}
