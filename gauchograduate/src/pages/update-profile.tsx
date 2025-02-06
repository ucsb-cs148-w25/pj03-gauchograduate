import { useSession } from 'next-auth/react';
import { useState, useEffect } from 'react';
import Navbar from '../app/components/Navbar';

export default function UpdateMajor() {
  const { data: session, status, update } = useSession({
    required: true,
    onUnauthenticated() {
      window.location.href = '/signin';
    },
  });
  
  const [major, setMajor] = useState('');
  const [firstQuarter, setFirstQuarter] = useState('20224'); // Will be updated from session
  const [message, setMessage] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  const quarterOptions = [
    { label: 'Fall 2022', value: '20224' },
    { label: 'Fall 2023', value: '20234' },
    { label: 'Fall 2024', value: '20244' },
    { label: 'Fall 2025', value: '20254' },
  ];

  // Update major and firstQuarter states once session is loaded
  useEffect(() => {
    if (status === 'authenticated') {
      if (session?.user?.major) {
        setMajor(session.user.major);
      }
      
      
      const courses = session?.user?.courses;
      if (courses && typeof courses === 'object' && 'firstQuarter' in courses) {
        setFirstQuarter(courses.firstQuarter);
      }
    }
  }, [session, status]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    setMessage('');

    try {
      const response = await fetch('/api/user/update-profile', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ major, firstQuarter }),
        credentials: 'include',
      });

      if (!response.ok) {
        throw new Error('Failed to update major');
      }

      setMessage('Profile updated successfully!');
      // Refresh the session to get the updated data
      await update();
    } catch (error) {
      console.log(error);
      setMessage('Failed to update profile. Please try again.');
    } finally {
      setIsLoading(false);
    }
  };

  // Show loading state while session is being fetched
  if (status === "loading") {
    return <div>Loading...</div>
  }

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      
      <div className="flex-1 flex items-center justify-center">
        <div className="bg-white p-8 rounded-lg shadow-md w-full max-w-md mx-4">
          <h1 className="text-2xl font-bold text-center mb-6">Update Your Profile</h1>
          
          <form onSubmit={handleSubmit} className="space-y-4">
            <div className="space-y-4">
              <div>
                <label htmlFor="major" className="block text-sm font-medium text-gray-700 mb-1">
                  Major
                </label>
                <input
                  type="text"
                  id="major"
                  value={major}
                  onChange={(e) => setMajor(e.target.value)}
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="Enter your major"
                  required
                />
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
              <p className={`text-sm ${message.includes('Failed') ? 'text-red-600' : 'text-green-600'}`}>
                {message}
              </p>
            )}

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
    </div>
  );
}
