import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Gaucho Graduate",
  description: "Plan your UCSB journey with ease using GauchoGraduate",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${geistSans.variable} ${geistMono.variable}`}>
        {/* Navigation bar*/}
        <header className="navbar">
          <nav className="container">
            <ul className="nav-list">
              <li><a href="/">Home</a></li>
              <li><a href="#planner">Planner</a></li>
              <li><a href="#about">About</a></li>
            </ul>
          </nav>
        </header>

        {/* Page content */}
        <main>{children}</main>

        {/* Footer */}
        <footer className="footer">
          <p>© 2025 GauchoGraduate. All rights reserved.</p>
        </footer>
      </body>
    </html>
  );
}
