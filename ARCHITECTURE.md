# DentalFlow Architecture

## Overview
DentalFlow is a modern dental practice management application built with React 18, TypeScript, Vite, TailwindCSS, and shadcn/ui components.

## Tech Stack
- **Frontend Framework**: React 18 with TypeScript
- **Build Tool**: Vite
- **Styling**: TailwindCSS + shadcn/ui
- **Routing**: React Router v6
- **Backend**: Supabase (PostgreSQL + Auth + Storage)
- **Error Tracking**: Sentry

## Project Structure

```
src/
├── modules/              # Feature modules
│   ├── dashboard/        # Dashboard module
│   ├── appointments/     # Appointments management
│   ├── patients/         # Patient management
│   ├── records/          # Dental records
│   └── settings/         # Application settings
├── shared/               # Shared resources
│   ├── components/       # Shared UI components
│   │   ├── AppShell.tsx  # Main layout wrapper
│   │   ├── Sidebar.tsx   # Navigation sidebar
│   │   └── Topbar.tsx    # Top navigation bar
│   ├── lib/              # Utility functions and clients
│   │   ├── utils.ts      # Helper functions
│   │   ├── supabase.ts   # Supabase client
│   │   └── sentry.ts     # Sentry configuration
│   ├── hooks/            # Custom React hooks
│   └── types/            # TypeScript type definitions
├── router.tsx            # Application routing
├── App.tsx               # Root application component
├── main.tsx              # Application entry point
└── index.css             # Global styles + Tailwind

```

## Architecture Principles

### 1. Modular Architecture
- Each feature is a self-contained module
- Modules contain their own components, hooks, and types
- Shared code lives in the `shared/` directory

### 2. Component Structure
- **AppShell**: Main layout component providing sidebar and topbar
- **Pages**: Top-level route components (one per module)
- **Components**: Reusable UI components

### 3. Routing
- Centralized routing configuration in `router.tsx`
- Each route wraps its page component in the AppShell layout
- Uses React Router v6 with data router pattern

### 4. State Management
- Local state with React hooks (useState, useReducer)
- Server state with React Query (to be added)
- Form state with React Hook Form (to be added)

### 5. Styling
- TailwindCSS for utility-first styling
- shadcn/ui for pre-built, customizable components
- CSS variables for theming (light/dark mode support)

## External Services

### Supabase
- **Location**: `src/shared/lib/supabase.ts`
- **Purpose**: Backend as a Service (Database, Auth, Storage)
- **Status**: Stub - client initialized but no calls made yet
- **Configuration**: Via environment variables

### Sentry
- **Location**: `src/shared/lib/sentry.ts`
- **Purpose**: Error tracking and performance monitoring
- **Status**: Stub - initialized but optional
- **Configuration**: Via environment variables

## Development Workflow

1. **Start Development Server**: `npm run dev`
2. **Build for Production**: `npm run build`
3. **Lint Code**: `npm run lint`
4. **Preview Production Build**: `npm run preview`

## Path Aliases

The project uses path aliases for cleaner imports:
```typescript
// Instead of: import { utils } from '../../../shared/lib/utils'
// Use: import { utils } from '@/shared/lib/utils'
```

Configuration:
- **vite.config.ts**: Defines `@` alias pointing to `./src`
- **tsconfig.app.json**: TypeScript path mapping for `@/*`

## Environment Variables

Create a `.env` file with:
```
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
VITE_SENTRY_DSN=your_sentry_dsn (optional)
```

## Next Steps

1. Implement authentication with Supabase Auth
2. Design and implement database schema
3. Add React Query for server state management
4. Implement CRUD operations for each module
5. Add form handling with React Hook Form
6. Implement proper error boundaries
7. Add loading states and skeletons
8. Configure Sentry error tracking
9. Add unit and integration tests
10. Implement CI/CD pipeline

## Guidelines

- Follow the modular structure for new features
- Use TypeScript for type safety
- Leverage Tailwind utilities for styling
- Keep components small and focused
- Write self-documenting code with clear naming
- Add comments only when necessary for complex logic
