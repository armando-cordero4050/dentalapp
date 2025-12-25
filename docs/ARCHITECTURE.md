# DentalFlow Architecture

## Principles
1. **Multi-tenancy**: Every business table must include `clinic_id`.
2. **Zero-Trust**: Frontend never decides permissions, prices, or status. RLS + Edge Functions enforce rules.
3. **Internal vs External Finance**:
   - Clinic accounts (Patient debt) are internal.
   - Lab accounts (Clinic debt) are external (Odoo).
4. **Idempotency**: All Odoo integrations must be idempotent.

## Supabase Layer (Foundation)
- **Tables**: `clinics` (root), `profiles` (users), `roles`, `permissions`.
- **RBAC**: Role-based access control with `roles` and `permissions` tables.
- **RLS**: Row Level Security is ENABLED on all tables.
  - `clinics`: Visible to members.
  - `profiles`: Visible to clinic members.
- **Functions**:
  - `get_current_clinic_id()`: Returns tenant ID from profile.
  - `has_permission(code)`: Checks permissions.

## Stack
- **Frontend**: React 18, Vite, TypeScript, TailwindCSS, shadcn/ui.
- **Backend**: Supabase Cloud (Postgres, Auth, Storage, Edge Functions).
- **ERP**: Odoo.sh (Laboratory management only).

## Module Isolation
Modules should be self-contained in `src/modules/`.
- `auth`: Authentication & ACL.
- `patients`: Patient management & Odontogram.
- `appointments`: Calendar & scheduling.
- `finance`: Budgeting & Internal Invoicing.
- `lab`: Lab orders & Odoo integration.

## State Management
- **Server State**: TanStack Query (React Query).
- **Local State**: React `useState` / `useReducer`.
- **Form State**: React Hook Form + Zod.
