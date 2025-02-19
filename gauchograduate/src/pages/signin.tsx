import { signIn } from 'next-auth/react';
import Navbar from '../app/components/Navbar';
import GoogleLogo from '../app/components/icons/GoogleLogo';
import Image from 'next/image';

export default function SignIn() {
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
