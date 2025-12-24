import { createBrowserRouter } from 'react-router-dom'
import { AppShell } from './shared/components/AppShell'
import { DashboardPage } from './modules/dashboard/DashboardPage'
import { AppointmentsPage } from './modules/appointments/AppointmentsPage'
import { PatientsPage } from './modules/patients/PatientsPage'
import { RecordsPage } from './modules/records/RecordsPage'
import { SettingsPage } from './modules/settings/SettingsPage'

export const router = createBrowserRouter([
  {
    path: '/',
    element: <AppShell><DashboardPage /></AppShell>,
  },
  {
    path: '/appointments',
    element: <AppShell><AppointmentsPage /></AppShell>,
  },
  {
    path: '/patients',
    element: <AppShell><PatientsPage /></AppShell>,
  },
  {
    path: '/records',
    element: <AppShell><RecordsPage /></AppShell>,
  },
  {
    path: '/settings',
    element: <AppShell><SettingsPage /></AppShell>,
  },
])
