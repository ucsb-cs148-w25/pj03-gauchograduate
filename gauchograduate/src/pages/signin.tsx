import { signIn } from 'next-auth/react';
import Navbar from '../app/components/Navbar';
import GoogleLogo from '../app/components/icons/GoogleLogo';

export default function SignIn() {
    return (
        <div className="min-h-screen flex flex-col">
            <Navbar />
            
            <div className="flex-1 flex items-center justify-center">
                <div className="bg-white p-8 rounded-lg shadow-md w-full max-w-md mx-4">
                    <h1 className="text-2xl font-bold text-center mb-6">Welcome to GauchoGraduate</h1>
                    <p className="text-gray-600 text-center mb-8">Please sign in to continue</p>
                    <button 
                        onClick={() => signIn('google', { callbackUrl: '/'})}
                        className="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors flex items-center justify-center gap-2"
                    >
                        <GoogleLogo />
                        Sign in with Google
                    </button>
                </div>
            </div>
        </div>
    );
}
