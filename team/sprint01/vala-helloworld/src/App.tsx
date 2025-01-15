import { useState } from 'react'
import Navbar from './Navbar'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <Navbar />
      <div id="content">
        <h1>Hello world!</h1>
        <div className="card">
          <button onClick={() => setCount((count) => count + 1)}>
            count is {count}
          </button>
          <p>
            State management ready
          </p>
        </div>
        <p className="about">
          This is a simple hello world starter app.
        </p>
      </div>
    </>
  )
}

export default App
