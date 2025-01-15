"use client";

import { useState } from "react";

export default function Home() {
  const [count, setCount] = useState(0);
  return (
    <div className="bg-black text-white">
      <nav className="bg-blue-900 p-5">
          <h1 className="text-2xl">GauchoGraduate</h1>
      </nav>
      <div className="flex flex-col items-center justify-center h-screen space-y-5">
        <h1 className="text-4xl font-bold">Chiran's Hello World</h1>
        <button
          onClick={() => setCount(count + 1)}
          className="bg-blue-900 font-bold py-3 px-5 rounded"
        >
          count is {count}
        </button>
        <h3 className="text-2xl">Minimum functionality for this framework.</h3>
      </div>
    </div>
  );
}
