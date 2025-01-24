import { signIn } from 'next-auth/react';

export default function SignIn() {
    return (
        <div>
            <h1> Welcome To GauchoGraduate </h1>
            <p> Please Sign In to Continue </p>
            <button onClick={() => signIn('google', { callbackUrl: '/dashboard'})}>
                Sign in with Google
            </button>
        </div>
    );
}


