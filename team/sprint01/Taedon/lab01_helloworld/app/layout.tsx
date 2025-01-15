import Navbar from './components/Navbar';
import './globals.css'; // Add if using global CSS

export const metadata = {
  title: 'GauchoPlanner Web App',
  description: 'A simple app with a navigation bar and hello world',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <Navbar />
        <main style={{ paddingTop: '4rem', textAlign: 'center' }}>
          {children}
        </main>
      </body>
    </html>
  );
}
