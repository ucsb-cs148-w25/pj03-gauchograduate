/* eslint-disable @typescript-eslint/no-unused-vars */
import type { Metadata } from "next";
import './globals.css';

import { Inter } from "next/font/google";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

export const metadata = {
  title: 'GauchoGraduate',
  description: 'Four-year schedule planner for college classes',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}