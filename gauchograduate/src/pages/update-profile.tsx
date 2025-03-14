import { useSession } from 'next-auth/react';
import { useState, useEffect } from 'react';
import Navbar from '../app/components/Navbar';
import { useQueryClient } from '@tanstack/react-query';

type Major = {
  id: number;
  name: string;
  college: string;
};

export default function UpdateMajor() {
  const { data: session, status, update } = useSession({
    required: true,
    onUnauthenticated() {
      window.location.href = '/signin';
    },
  });
  
  const queryClient = useQueryClient();
  
  const [major, setMajor] = useState('');
  const [majors, setMajors] = useState<Major[]>([]);
  const [firstQuarter, setFirstQuarter] = useState('20224');
  const [message, setMessage] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [filteredMajors, setFilteredMajors] = useState<Major[]>([]);
  const [isInputFocused, setIsInputFocused] = useState(false);
  const [showClearConfirm, setShowClearConfirm] = useState(false);
  const [clearingCourses, setClearingCourses] = useState(false);

  const quarterOptions = [
    { label: 'Fall 2018', value: '20184' },
    { label: 'Fall 2019', value: '20194' },
    { label: 'Fall 2020', value: '20204' },
    { label: 'Fall 2021', value: '20214' },
    { label: 'Fall 2022', value: '20224' },
    { label: 'Fall 2023', value: '20234' },
    { label: 'Fall 2024', value: '20244' },
    { label: 'Fall 2025', value: '20254' },
    { label: 'Fall 2026', value: '20264' },
    { label: 'Fall 2027', value: '20274' },
    { label: 'Fall 2028', value: '20284' },
  ];

  useEffect(() => {
    fetch('/api/major/all')
      .then(res => res.json())
      .then(data => {
        if (data.majors) {
          setMajors(data.majors);
        }
      })
      .catch(error => console.error('Error fetching majors:', error));
  }, []);

  useEffect(() => {
    if (status === 'authenticated' && session?.user) {
      console.log('Session user:', session.user); // Add logging to debug
      if (session.user.majorId && majors.length > 0) {
        const userMajor = majors.find(m => m.id === session.user.majorId);
        if (userMajor) {
          setMajor(userMajor.name);
        }
      }
      
      const courses = session.user.courses;
      if (courses && typeof courses === 'object' && 'firstQuarter' in courses) {
        setFirstQuarter(courses.firstQuarter);
      }
    }
  }, [session, status, majors]);

  useEffect(() => {
    const filtered = majors.filter(m => 
      m.name.toLowerCase().includes(major.toLowerCase())
    );
    setFilteredMajors(filtered);
  }, [major, majors]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    setMessage('');

    const selectedMajor = majors.find(m => m.name === major);
    if (!selectedMajor) {
      setMessage('Please select a valid major from the list');
      setIsLoading(false);
      return;
    }

    try {
      const response = await fetch('/api/user/update-profile', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ majorId: selectedMajor.id, firstQuarter }),
        credentials: 'include',
      });

      if (!response.ok) {
        throw new Error('Failed to update major');
      }

      setMessage('Profile updated successfully!');
      
      queryClient.invalidateQueries({ queryKey: ['userCourses', session?.user?.id] });
      queryClient.invalidateQueries({ queryKey: ['savedSchedule'] });
      
      await update();
    } catch (error) {
      console.log(error);
      setMessage('Failed to update profile. Please try again.');
    } finally {
      setIsLoading(false);
    }
  };

  const handleClearAllCourses = async () => {
    setClearingCourses(true);
    setMessage('');

    try {
      const response = await fetch('/api/user/clear-all-courses', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
      });

      if (!response.ok) {
        throw new Error('Failed to clear courses');
      }

      setMessage('All courses have been cleared successfully!');
      
      // Invalidate queries to refresh data
      queryClient.invalidateQueries({ queryKey: ['userCourses', session?.user?.id] });
      queryClient.invalidateQueries({ queryKey: ['savedSchedule'] });
      
      await update();
      setShowClearConfirm(false);
    } catch (error) {
      console.error(error);
      setMessage('Failed to clear courses. Please try again.');
    } finally {
      setClearingCourses(false);
    }
  };

  if (status === "loading") {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center">
        <div className="animate-spin h-10 w-10 border-4 border-blue-500 rounded-full border-t-transparent"></div>
        <p className="mt-4 text-gray-600">Loading...</p>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      
      <div className="flex-1 flex items-center justify-center p-4">
        <div className="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
          <h1 className="text-2xl font-bold text-center mb-6">Update Your Profile</h1>
          
          <form onSubmit={handleSubmit} className="space-y-4">
            <div className="space-y-4">
              <div className="relative">
                <label htmlFor="major" className="block text-sm font-medium text-gray-700 mb-1">
                  Major
                </label>
                <input
                  type="text"
                  id="major"
                  value={major}
                  onChange={(e) => setMajor(e.target.value)}
                  onFocus={() => setIsInputFocused(true)}
                  onBlur={() => {
                    // Small delay to allow clicking on suggestions
                    setTimeout(() => setIsInputFocused(false), 200);
                  }}
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="Enter your major"
                  required
                  autoComplete="off"
                />
                {isInputFocused && (major ? filteredMajors : majors).length > 0 && (
                  <ul className="absolute z-10 w-full bg-white border border-gray-300 rounded-md mt-1 max-h-60 overflow-auto">
                    {(major ? filteredMajors : majors).map((m) => (
                      <li
                        key={m.id}
                        className="px-3 py-2 hover:bg-gray-100 cursor-pointer"
                        onClick={() => {
                          setMajor(m.name);
                          setIsInputFocused(false);
                        }}
                      >
                        {m.name} - {m.college}
                      </li>
                    ))}
                  </ul>
                )}
              </div>

              <div>
                <label htmlFor="firstQuarter" className="block text-sm font-medium text-gray-700 mb-1">
                  First Quarter at UCSB
                </label>
                <select
                  id="firstQuarter"
                  value={firstQuarter}
                  onChange={(e) => setFirstQuarter(e.target.value)}
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                  required
                >
                  {quarterOptions.map((option) => (
                    <option key={option.value} value={option.value}>
                      {option.label}
                    </option>
                  ))}
                </select>
              </div>
            </div>

            {message && (
              <p className={`text-sm ${message.includes('Failed') || message.includes('valid') ? 'text-red-600' : 'text-green-600'}`}>
                {message}
              </p>
            )}

            <button
              type="button"
              onClick={() => setShowClearConfirm(true)}
              className="w-full bg-red-500 text-white py-2 px-4 rounded-md hover:bg-red-600 transition-colors mb-3"
            >
              Clear All Courses
            </button>

            <button
              type="submit"
              disabled={isLoading}
              className={`w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors ${
                isLoading ? 'opacity-50 cursor-not-allowed' : ''
              }`}
            >
              {isLoading ? 'Updating...' : 'Update Profile'}
            </button>
          </form>
        </div>
      </div>

      {/* Clear All Courses Confirmation Modal */}
      {showClearConfirm && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white p-6 rounded-lg shadow-xl max-w-md w-full m-4 relative">
            <button 
              onClick={() => setShowClearConfirm(false)}
              className="absolute top-4 right-4 text-gray-500 hover:text-gray-700 transition-colors"
              aria-label="Close confirmation"
            >
              <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>

            <div className="mb-4 flex items-center">
              <svg xmlns="http://www.w3.org/2000/svg" className="h-8 w-8 text-red-500 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
              </svg>
              <h3 className="text-xl font-bold text-red-700">Clear All Courses</h3>
            </div>
            
            <div className="space-y-3">
              <p className="text-gray-700">
                Are you sure you want to clear <span className="font-bold">all courses</span> from your 4-year plan?
              </p>
              <p className="text-gray-600">
                This action cannot be undone. All your courses across all years will be permanently removed.
              </p>
            </div>
            
            <div className="mt-6 flex justify-between">
              <button
                onClick={() => setShowClearConfirm(false)}
                className="bg-gray-300 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-400 transition-colors"
              >
                Cancel
              </button>
              
              <button
                onClick={handleClearAllCourses}
                disabled={clearingCourses}
                className={`bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-colors ${
                  clearingCourses ? 'opacity-50 cursor-not-allowed' : ''
                }`}
              >
                {clearingCourses ? 'Clearing...' : 'Clear All Courses'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
