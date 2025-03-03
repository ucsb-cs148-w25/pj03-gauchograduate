import { useSession } from 'next-auth/react';
import { useRouter } from 'next/router';
import { useEffect } from 'react';
import Navbar from '../app/components/Navbar';

export default function Dashboard() {
    const { data: session, status } = useSession();
    const router = useRouter();

    useEffect(() => {
        if (status === 'unauthenticated') {
            router.push('/signin');
        }
    }, [status, router]);

    if (status === 'loading') {
        return (
            <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-white to bg-[var(--pale-blue)]">
                <div className="animate-pulse text-gray-600">Loading...</div>
            </div>
        );
    }

    if (!session) {
        return null;
    }

    return (
        <div className="min-h-screen flex flex-col bg-gradient-to-br from-white to bg-[var(--pale-blue)]">
            <Navbar />
            <div className="flex-1 container mx-auto px-4 py-8">
                <div className="bg-white rounded-lg shadow-lg p-6">
                    <h1 className="text-2xl font-bold mb-4">Welcome, {session.user?.name}!</h1>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                        {/* Profile Section */}
                        <div className="bg-gray-50 rounded-lg p-4">
                            <h2 className="text-lg font-semibold mb-3">Profile</h2>
                            <div className="space-y-2">
                                <p><span className="font-medium">Email:</span> {session.user?.email}</p>
                                <p><span className="font-medium">Major:</span> {session.user?.majorId ? 'Set' : 'Not set'}</p>
                            </div>
                        </div>

                        {/* Quick Actions */}
                        <div className="bg-gray-50 rounded-lg p-4">
                            <h2 className="text-lg font-semibold mb-3">Quick Actions</h2>
                            <div className="space-y-2">
                                <button 
                                    onClick={() => router.push('/update-profile')}
                                    className="w-full bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors"
                                >
                                    Update Profile
                                </button>
                                <button 
                                    onClick={() => router.push('/')}
                                    className="w-full bg-green-500 text-white py-2 px-4 rounded hover:bg-green-600 transition-colors"
                                >
                                    View Course Catalog
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}