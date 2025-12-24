import { RouterProvider } from 'react-router-dom'
import { router } from './router'
import { useEffect } from 'react'
import { initSentry } from './shared/lib/sentry'

function App() {
  useEffect(() => {
    // Initialize Sentry on app mount
    initSentry()
  }, [])

  return <RouterProvider router={router} />
}

export default App
