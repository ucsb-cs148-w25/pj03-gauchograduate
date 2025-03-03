import { signIn, useSession } from 'next-auth/react';
import { useRouter } from 'next/router';
import GoogleLogo from '../app/components/icons/GoogleLogo';
import Image from 'next/image';
import { useEffect, useState } from 'react';

export default function SignIn() {
    const router = useRouter();
    const { data: session, status } = useSession();
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        if (session) {
            router.push('/');
        }
    }, [session, router]);

    const handleSignIn = async () => {
        try {
            setIsLoading(true);
            setError(null);
            const result = await signIn('google', { 
                callbackUrl: '/',
                redirect: false 
            });
            
            if (result?.error) {
                setError('Failed to sign in. Please try again.');
            }
        } catch (err) {
            setError('An unexpected error occurred. Please try again.');
        } finally {
            setIsLoading(false);
        }
    };

    if (status === 'loading') {
        return (
            <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-white to bg-[var(--pale-blue)]">
                <div className="animate-pulse text-gray-600">Loading...</div>
            </div>
        );
    }

    return (
        <div className="min-h-screen flex flex-col bg-gradient-to-br from-white to bg-[var(--pale-blue)]">
            <div className="flex-1 flex items-center justify-center">
                <div className="bg-white p-6 rounded-2xl shadow-lg flex flex-row items-center gap-12 w-full max-w-3xl">
                    {/* Colored Grid */}
                    <div className="grid grid-cols-2 gap-2">
                        <div className="w-48 h-48 bg-[var(--pale-orange)] rounded-lg"></div>
                        <div className="w-48 h-48 bg-[var(--pale-pink)] rounded-lg"></div>
                        <div className="w-48 h-48 bg-[var(--pale-green)] rounded-lg"></div>
                        <div className="w-48 h-48 bg-[var(--pale-blue)] rounded-lg"></div>
                    </div>

                    {/* Sign-in Section */}
                    <div className="text-left ml-6">
                        <Image src="/logo1.png" alt="Gaucho Graduate Logo" width={180} height={60} />
                        <p className="text-gray-600 mb-6">Please sign in with your UCSB account to continue.</p>
                        
                        {error && (
                            <div className="mb-4 text-red-500 text-sm">
                                {error}
                            </div>
                        )}
                        
                        <button 
                            onClick={handleSignIn}
                            disabled={isLoading}
                            className={`bg-[var(--off-white)] text-black py-2 px-4 rounded-md flex items-center justify-center gap-2 w-full transition-colors ${
                                isLoading ? 'opacity-50 cursor-not-allowed' : 'hover:bg-gray-300'
                            }`}
                        >
                            <GoogleLogo />
                            {isLoading ? 'Signing in...' : 'Sign in with Google'}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}
