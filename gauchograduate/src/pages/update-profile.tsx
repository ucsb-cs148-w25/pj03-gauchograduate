import { useSession } from 'next-auth/react';
import { useState, useEffect } from 'react';
import Navbar from '../app/components/Navbar';

export default function UpdateMajor() {
  const { data: session, status } = useSession({
    required: true,
    onUnauthenticated() {
      window.location.href = '/signin';
    },
  });
  
  const [major, setMajor] = useState('');
  const [message, setMessage] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  // Update major state once session is loaded
  useEffect(() => {
    if (status === 'authenticated' && session?.user?.major) {
      setMajor(session.user.major);
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
        body: JSON.stringify({ major }),
        credentials: 'include',
      });

      if (!response.ok) {
        throw new Error('Failed to update major');
      }

      setMessage('Major updated successfully!');
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
              {isLoading ? 'Updating...' : 'Update Major'}
            </button>
          </form>
        </div>
      </div>
    </div>
  );
}
