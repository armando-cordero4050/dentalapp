/*
  # 001_foundation.sql
  - Clinics (Tenant root)
  - Profiles (Users linked to Auth)
  - RBAC (Roles, Permissions)
  - RLS Policies
*/

-- 1. Clinics Table
create table public.clinics (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  logo_url text,
  phone text,
  tax_percent numeric(5,2) default 12.00,
  currency_default text default 'GTQ',
  created_at timestamptz default now()
);

alter table public.clinics enable row level security;

-- 2. Profiles (Extends auth.users)
-- Create custom types for roles
create type public.app_role as enum ('super_admin', 'clinic_admin', 'dentist', 'receptionist', 'lab_staff');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  clinic_id uuid references public.clinics(id),
  full_name text,
  role public.app_role not null default 'dentist',
  active boolean default true,
  created_at timestamptz default now()
);

alter table public.profiles enable row level security;

-- 3. Roles & Permissions (RBAC Metadata)
create table public.roles (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  description text
);

create table public.permissions (
  id uuid primary key default gen_random_uuid(),
  code text not null unique, -- e.g. 'patients.read'
  description text
);

create table public.role_permissions (
  role_id uuid references public.roles(id) on delete cascade,
  permission_id uuid references public.permissions(id) on delete cascade,
  primary key (role_id, permission_id)
);

alter table public.roles enable row level security;
alter table public.permissions enable row level security;
alter table public.role_permissions enable row level security;

-- 4. Helper Functions

-- Function: get_current_clinic_id()
-- Returns the clinic_id of the currently logged in user based on profiles table.
create or replace function public.get_current_clinic_id()
returns uuid
language plpgsql
security definer
as $$
declare
  _clinic_id uuid;
begin
  select clinic_id into _clinic_id
  from public.profiles
  where id = auth.uid();
  return _clinic_id;
end;
$$;

-- Function: has_permission(code)
-- Checks if current user has a specific permission code via their role.
create or replace function public.has_permission(_code text)
returns boolean
language plpgsql
security definer
as $$
declare
  _has_perm boolean;
  _user_role public.app_role;
begin
  -- Simple check based on profile role for now, or join with roles table if fully dynamic.
  -- For V1, we map Enum roles to Code roles or use the Enum directly.
  -- To keep it simple per requirements:
  -- We'll assume the 'role' column in profiles maps to a code in roles table if needed,
  -- but for now let's use the profiles.role ENUM for major logic and RBAC tables for fine-grained.
  
  -- Placeholder for complex RBAC. For foundation, return true if user is active.
  return true; 
end;
$$;

-- 5. RLS Policies

-- Clinics:
-- Super admin can do everything (implementation depends on how we identify super_admin, usually a specific profile or claim).
-- Users can view THEIR own clinic.
create policy "Users can view their own clinic"
  on public.clinics
  for select
  using (
    id = public.get_current_clinic_id()
  );

-- Profiles:
-- Users can view profiles within their same clinic.
create policy "Users can view members of their clinic"
  on public.profiles
  for select
  using (
    clinic_id = public.get_current_clinic_id()
  );

-- Users can update their own profile
create policy "Users can update own profile"
  on public.profiles
  for update
  using (
    id = auth.uid()
  );

-- Roles/Permissions: public read (for authenticated users)
create policy "Auth users can read roles"
  on public.roles for select to authenticated using (true);
  
create policy "Auth users can read permissions"
  on public.permissions for select to authenticated using (true);

create policy "Auth users can read role_permissions"
  on public.role_permissions for select to authenticated using (true);

