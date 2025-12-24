# DentalFlow

**Aplicación dental para Guatemala** - A modern dental practice management system.

## Overview

DentalFlow is a comprehensive dental practice management application built with modern web technologies. It provides tools for managing patients, appointments, dental records, and practice operations.

## Tech Stack

- **Frontend**: React 18 + TypeScript
- **Build Tool**: Vite
- **Styling**: TailwindCSS + shadcn/ui
- **Routing**: React Router v6
- **Backend**: Supabase (PostgreSQL + Auth + Storage)
- **Error Tracking**: Sentry
- **Icons**: Lucide React

## Quick Start

### Prerequisites

- Node.js 18+ and npm
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/armando-cordero4050/dentalapp.git
cd dentalapp
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the root directory:
```bash
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
VITE_SENTRY_DSN=your_sentry_dsn
```

4. Start the development server:
```bash
npm run dev
```

5. Open [http://localhost:5173](http://localhost:5173) in your browser

## Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint

## Project Structure

```
dentalapp/
├── src/
│   ├── modules/              # Feature modules
│   │   ├── dashboard/        # Dashboard
│   │   ├── appointments/     # Appointments
│   │   ├── patients/         # Patient management
│   │   ├── records/          # Dental records
│   │   └── settings/         # Settings
│   ├── shared/               # Shared resources
│   │   ├── components/       # Shared components
│   │   ├── lib/              # Utilities and clients
│   │   ├── hooks/            # Custom hooks
│   │   └── types/            # TypeScript types
│   ├── router.tsx            # App routing
│   ├── App.tsx               # Root component
│   └── main.tsx              # Entry point
├── public/                   # Static assets
├── ARCHITECTURE.md           # Architecture documentation
├── UI_KIT_DENTALFLOW.md      # UI/UX guidelines
└── PR_GUIDELINES.md          # PR best practices
```

## Features

### Current
- ✅ Modern React 18 + TypeScript setup
- ✅ Vite build system with HMR
- ✅ TailwindCSS styling with dark mode support
- ✅ Modular architecture with clean separation
- ✅ AppShell layout (sidebar + topbar)
- ✅ React Router v6 routing
- ✅ Supabase client stub
- ✅ Sentry error tracking stub

### Planned
- 🔄 Authentication system
- 🔄 Patient management CRUD
- 🔄 Appointment scheduling
- 🔄 Dental records system
- 🔄 Dashboard analytics
- 🔄 Settings management
- 🔄 Role-based access control

## Documentation

- **[ARCHITECTURE.md](./ARCHITECTURE.md)** - System architecture and design principles
- **[UI_KIT_DENTALFLOW.md](./UI_KIT_DENTALFLOW.md)** - UI components and styling guide
- **[PR_GUIDELINES.md](./PR_GUIDELINES.md)** - Pull request standards and workflow

## Development

### Adding a New Module

1. Create module directory: `src/modules/your-module/`
2. Add page component: `YourModulePage.tsx`
3. Update `router.tsx` with new route
4. Add navigation item to `Sidebar.tsx`

### Adding shadcn/ui Components

```bash
npx shadcn@latest add [component-name]
```

Example:
```bash
npx shadcn@latest add button
npx shadcn@latest add dialog
```

### Code Style

- Use TypeScript strict mode
- Follow ESLint rules
- Use Tailwind utility classes
- Keep components small and focused
- Write self-documenting code

## Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `VITE_SUPABASE_URL` | Supabase project URL | Yes (for backend) |
| `VITE_SUPABASE_ANON_KEY` | Supabase anonymous key | Yes (for backend) |
| `VITE_SENTRY_DSN` | Sentry DSN for error tracking | No |

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feat/your-feature`
3. Commit your changes: `git commit -m 'feat: add some feature'`
4. Push to the branch: `git push origin feat/your-feature`
5. Submit a pull request

See [PR_GUIDELINES.md](./PR_GUIDELINES.md) for detailed guidelines.

## License

This project is proprietary and confidential.

## Support

For issues and questions, please create an issue in the GitHub repository.

---

Built with ❤️ for dental practices in Guatemala
