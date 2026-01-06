import { Link, useLocation } from 'react-router-dom'
import { Home, Calendar, Users, Settings, FileText } from 'lucide-react'
import { cn } from '../lib/utils'

const navigationItems = [
  { label: 'Dashboard', path: '/', icon: Home },
  { label: 'Appointments', path: '/appointments', icon: Calendar },
  { label: 'Patients', path: '/patients', icon: Users },
  { label: 'Records', path: '/records', icon: FileText },
  { label: 'Settings', path: '/settings', icon: Settings },
]

export function Sidebar() {
  const location = useLocation()

  return (
    <aside className="w-64 bg-white border-r border-gray-200 flex flex-col">
      <div className="p-6 border-b border-gray-200">
        <h1 className="text-2xl font-bold text-primary">DentalFlow</h1>
        <p className="text-sm text-muted-foreground">Practice Management</p>
      </div>
      
      <nav className="flex-1 p-4 space-y-1">
        {navigationItems.map((item) => {
          const Icon = item.icon
          const isActive = location.pathname === item.path
          
          return (
            <Link
              key={item.path}
              to={item.path}
              className={cn(
                'flex items-center gap-3 px-4 py-3 rounded-lg transition-colors',
                isActive
                  ? 'bg-primary text-primary-foreground'
                  : 'text-gray-700 hover:bg-gray-100'
              )}
            >
              <Icon className="w-5 h-5" />
              <span className="font-medium">{item.label}</span>
            </Link>
          )
        })}
      </nav>
      
      <div className="p-4 border-t border-gray-200">
        <p className="text-xs text-muted-foreground text-center">
          DentalFlow v0.0.0
        </p>
      </div>
    </aside>
  )
}
