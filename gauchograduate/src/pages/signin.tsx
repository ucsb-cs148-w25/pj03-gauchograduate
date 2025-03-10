import { signIn } from 'next-auth/react';
import GoogleLogo from '../app/components/icons/GoogleLogo';
import Image from 'next/image';

export default function SignIn() {
    return (
        <div className="min-h-screen flex flex-col bg-gradient-to-br from-white to bg-[var(--pale-blue)]">
            
            <div className="flex-1 flex items-center justify-center p-4">
                <div className="bg-white p-6 rounded-2xl shadow-lg flex flex-col items-center gap-4 w-full max-w-md">
                    {/* Logo */}
                    <Image src="/logo1.png" alt="Gaucho Graduate Logo" width={180} height={60} className="mb-0" />
                    
                    {/* Colored Grid - Smaller on mobile */}
                    <div className="grid grid-cols-2 gap-2 w-full max-w-xs mx-auto my-2">
                        <div className="w-full aspect-square bg-[var(--pale-orange)] rounded-lg"></div>
                        <div className="w-full aspect-square bg-[var(--pale-pink)] rounded-lg"></div>
                        <div className="w-full aspect-square bg-[var(--pale-green)] rounded-lg"></div>
                        <div className="w-full aspect-square bg-[var(--pale-blue)] rounded-lg"></div>
                    </div>
                    
                    {/* Sign-in Section */}
                    <div className="w-full text-center">
                        <p className="text-gray-600 mb-6">Please sign in to continue.</p>
                        <button 
                            onClick={() => signIn('google', { callbackUrl: '/'})}
                            className="bg-[var(--off-white)] text-black py-2 px-4 rounded-md flex items-center justify-center gap-2 w-full hover:bg-gray-300 transition-colors"
                        >
                            <GoogleLogo />
                            Sign in with Google
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}
