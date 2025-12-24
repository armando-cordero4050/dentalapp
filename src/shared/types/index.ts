// Shared type definitions for DentalFlow

export interface User {
  id: string
  email: string
  name: string
}

export interface NavigationItem {
  label: string
  path: string
  icon?: React.ComponentType<{ className?: string }>
}
