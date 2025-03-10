'use client';

import { useSession, signOut } from "next-auth/react";
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import Image from 'next/image';
import { useState } from 'react';

export default function Navbar() {
  const { data: session } = useSession();
  const pathname = usePathname();
  const [menuOpen, setMenuOpen] = useState(false);

  return (
    <nav className="py-3 px-5 bg-[var(--background)] border-b border-gray-300">
      <div className="flex justify-between items-center">
        <Link href="/">
          <Image src="/navbarlogo.png" alt="GauchoGraduate Logo" width={200} height={40} className="h-10 w-auto" />
        </Link>
        
        <div className="hidden md:flex items-center gap-4">
          {session?.user?.name && (
            <>
              <span>Logged in as {session.user.name.split(' ')[0]}</span>
              {pathname !== '/update-profile' && (
                <Link 
                  href="/update-profile"
                  className="px-3 py-1 border border-blue-500 text-blue-500 rounded-md hover:bg-blue-500 hover:text-white transition-colors"
                >
                  Edit Profile
                </Link>
              )}
              {pathname === '/update-profile' && (
                <Link 
                  href="/"
                  className="px-3 py-1 border border-blue-500 text-blue-500 rounded-md hover:bg-blue-500 hover:text-white transition-colors flex items-center gap-2"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 10h16M4 14h16M4 18h16" />
                  </svg>
                  Dashboard
                </Link>
              )}
              <button 
                onClick={() => signOut({ callbackUrl: '/signin' })}
                className="px-3 py-1 bg-red-500 text-white rounded-md hover:bg-red-600 transition-colors"
              >
                Log Out
              </button>
            </>
          )}
        </div>
        
        <button 
          className="md:hidden flex items-center"
          onClick={() => setMenuOpen(!menuOpen)}
          aria-label={menuOpen ? "Close menu" : "Open menu"}
        >
          {menuOpen ? (
            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          ) : (
            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          )}
        </button>
      </div>
      
      {menuOpen && session?.user?.name && (
        <div className="md:hidden mt-3 pt-3 border-t border-gray-200 flex flex-col gap-3">
          <span className="text-sm">Logged in as {session.user.name.split(' ')[0]}</span>
          {pathname !== '/update-profile' && (
            <Link 
              href="/update-profile"
              className="text-sm px-3 py-1 border border-blue-500 text-blue-500 rounded-md hover:bg-blue-500 hover:text-white transition-colors text-center"
            >
              Edit Profile
            </Link>
          )}
          {pathname === '/update-profile' && (
            <Link 
              href="/"
              className="text-sm px-3 py-1 border border-blue-500 text-blue-500 rounded-md hover:bg-blue-500 hover:text-white transition-colors flex items-center justify-center gap-2"
            >
              <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 10h16M4 14h16M4 18h16" />
              </svg>
              Dashboard
            </Link>
          )}
          <button 
            onClick={() => signOut({ callbackUrl: '/signin' })}
            className="text-sm px-3 py-1 bg-red-500 text-white rounded-md hover:bg-red-600 transition-colors"
          >
            Log out
          </button>
        </div>
      )}
    </nav>
  );
}
