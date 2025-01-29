import Navbar from '@/app/components/Navbar'

export default function Custom404() {
  return (
    <div className="min-h-screen bg-[var(--background)]">
      <Navbar />
      <div className="flex items-center justify-center h-[calc(100vh-73px)]">
        <div className="bg-white p-8 rounded-xl shadow-lg text-center">
          <h1 className="text-6xl font-bold text-gray-800 mb-4">404</h1>
          <p className="text-gray-600">Page not found</p>
        </div>
      </div>
    </div>
  )
}
