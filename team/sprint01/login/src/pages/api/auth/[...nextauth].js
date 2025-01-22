import NextAuth from "next-auth"
import Google from "next-auth/providers/google"

export const authOptions = {
    providers: [
        Google({
            clientId: process.env.GOOGLE_CLIENT_ID,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET,
        }),
    ],
    callbacks: {
        async session({ session, token }) {
            session.user.id = token.sub;
            session.user.accessToekn = token.accessToken;
            return session;
        }
    },
}

export default NextAuth(authOptions)
