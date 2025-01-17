import Image from "next/image";

export default function Home() {
  return (
    <div className="grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20 font-[family-name:var(--font-geist-sans)]">
      {/* Navigation Bar */}
      <header className="row-start-1 flex justify-center gap-8 py-4 bg-gray-100 w-full shadow-md">
        <a
          className="text-black hover:underline"
          href="/"
        >
          Home
        </a>
        <a
          className="text-black hover:underline"
          href="/about"
        >
          About
        </a>
        <a
          className="text-black hover:underline"
          href="/contact"
        >
          Contact
        </a>
      </header>

      {/* Main Content */}
      <main className="flex flex-col gap-8 row-start-2 items-center sm:items-start">
        <h1 className="text-4xl font-bold">Hello, World!</h1>
        <p className="text-lg text-center sm:text-left">
          Welcome to the Hello World app.
        </p>
      </main>

      {/* Footer */}
      <footer className="row-start-3 flex gap-6 flex-wrap items-center justify-center">
        <a
          className="flex items-center gap-2 hover:underline hover:underline-offset-4"
          href="https://nextjs.org/docs"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Image
            aria-hidden
            src="/file.svg"
            alt="File icon"
            width={16}
            height={16}
          />
          Documentation
        </a>
        <a
          className="flex items-center gap-2 hover:underline hover:underline-offset-4"
          href="https://vercel.com"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Image
            aria-hidden
            src="/vercel.svg"
            alt="Vercel logo"
            width={16}
            height={16}
          />
          Deploy Now
        </a>
      </footer>
    </div>
  );
}

