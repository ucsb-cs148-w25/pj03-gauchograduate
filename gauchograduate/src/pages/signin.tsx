import { signIn } from 'next-auth/react';
import GoogleLogo from '../app/components/icons/GoogleLogo';
import Image from 'next/image';

export default function SignIn() {
    return (
        <div className="min-h-screen flex flex-col bg-gradient-to-br from-white to bg-[var(--pale-blue)]">
            <div className="flex-1 flex items-center justify-center p-4">
                <div className="bg-white p-6 rounded-2xl shadow-lg flex flex-col md:flex-row items-center gap-8 md:gap-12 w-full max-w-3xl">
                    {/* Colored Grid - Hidden on small screens */}
                    <div className="hidden md:grid grid-cols-2 gap-2">
                        <div className="w-48 h-48 bg-[var(--pale-orange)] rounded-lg"></div>
                        <div className="w-48 h-48 bg-[var(--pale-pink)] rounded-lg"></div>
                        <div className="w-48 h-48 bg-[var(--pale-green)] rounded-lg"></div>
                        <div className="w-48 h-48 bg-[var(--pale-blue)] rounded-lg"></div>
                    </div>
                    
                    {/* Mobile-only decorative element */}
                    <div className="flex md:hidden justify-center w-full mb-6">
                        <div className="grid grid-cols-2 gap-2 scale-75">
                            <div className="w-24 h-24 bg-[var(--pale-orange)] rounded-lg"></div>
                            <div className="w-24 h-24 bg-[var(--pale-pink)] rounded-lg"></div>
                            <div className="w-24 h-24 bg-[var(--pale-green)] rounded-lg"></div>
                            <div className="w-24 h-24 bg-[var(--pale-blue)] rounded-lg"></div>
                        </div>
                    </div>
                    
                    {/* Sign-in Section */}
                    <div className="text-center md:text-left md:ml-6 w-full md:w-auto">
                        <div className="flex justify-center md:justify-start">
                            <Image src="/logo1.png" alt="Gaucho Graduate Logo" width={180} height={60} />
                        </div>
                        <p className="text-gray-600 mb-6 mt-4">Please sign in to continue.</p>
                        <button
                            onClick={() => signIn('google', { callbackUrl: '/' })}
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