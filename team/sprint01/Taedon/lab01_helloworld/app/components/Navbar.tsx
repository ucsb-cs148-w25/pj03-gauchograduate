"use client"; // Required to make it a client component
import Link from 'next/link';

export default function Navbar() {
  return (
    <nav style={styles.nav}>
      <ul style={styles.navList}>
        <li style={styles.navItem}>
          <Link href="/">Home</Link>
        </li>
      </ul>
    </nav>
  );
}

const styles = {
  nav: {
    backgroundColor: '#0070f3',
    padding: '1rem',
    width: '100%',
    position: 'fixed' as const,
    top: 0,
  },
  navList: {
    display: 'flex',
    justifyContent: 'space-around',
    listStyleType: 'none',
    padding: 0,
    margin: 0,
  },
  navItem: {
    color: '#fff',
    fontWeight: 'bold',
  },
};
