import Image from "next/image";

export default function Home() {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen p-8 pb-20 gap-16 sm:p-20 font-[family-name:var(--font-geist-sans)]">
      <main className="flex flex-col gap-8 items-center text-center">
        <h1 className="text-center">Hello World!</h1>
        <p className="font-[family-name:var(--font-geist-mono)]">
          This next app will function as the backbone that GauchoGraduate can be built on.
        </p>
      </main>
      <footer className="row-start-3 flex gap-6 flex-wrap items-center justify-center">
        <a
          className="flex items-center gap-2 hover:underline hover:underline-offset-4"
          href="https://github.com/ucsb-cs148-w25/pj03-gauchograduate"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Image
            aria-hidden
            src="/globe.svg"
            alt="Globe icon"
            width={16}
            height={16}
          />
          View the repo →
        </a>
      </footer>
    </div>
  );
}
