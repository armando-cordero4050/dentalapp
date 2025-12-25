/*
  # 002_patients.sql
  - Patients Table
  - Constraints (Unique Email per Clinic, Gender Enum)
  - RLS Policies (Strict Multi-tenant)
  - Indexes
*/

-- 1. Create Gender Type if not exists
do $$ begin
    create type public.gender as enum ('M', 'F', 'O');
exception
    when duplicate_object then null;
end $$;

-- 2. Create Patients Table
create table public.patients (
  id uuid primary key default gen_random_uuid(),
  clinic_id uuid not null references public.clinics(id),
  first_name text not null,
  last_name text not null,
  date_of_birth date,
  gender public.gender not null default 'O',
  email text,
  phone text,
  address text,
  medical_history_summary text,
  currency_code text default 'GTQ', -- User-level decision: Patient preferred currency
  created_at timestamptz default now(),
  updated_at timestamptz default now(),

  -- Constraints
  constraint patients_email_clinic_unique unique (clinic_id, email)
);

-- 3. Enable RLS
alter table public.patients enable row level security;

-- 4. Triggers (updated_at)
-- Assuming a generic handle_updated_at function exists or we create one specific
create or replace function public.handle_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger set_updated_at
  before update on public.patients
  for each row
  execute function public.handle_updated_at();

-- 5. RLS Policies

-- SELECT: Only see patients in own clinic
create policy "Users can view patients in their clinic"
  on public.patients
  for select
  using (
    clinic_id = public.get_current_clinic_id()
  );

-- INSERT: Only insert into own clinic
create policy "Users can create patients in their clinic"
  on public.patients
  for insert
  with check (
    clinic_id = public.get_current_clinic_id()
  );

-- UPDATE: Only update in own clinic
create policy "Users can update patients in their clinic"
  on public.patients
  for update
  using (
    clinic_id = public.get_current_clinic_id()
  );

-- DELETE: Restricted (e.g., only Admin/Owner)
-- For V1 foundation, we allow delete if user is in the clinic AND has specific permission if we enforced it,
-- but strictly generally we might want to prevent deletion of clinical data.
-- Standard approach: Allow clinic admins to delete, or restrict completely.
-- Per ADR-0003 (Zero-Trust), let's rely on RLS. 
-- We'll allow deletion for clinic_admin only for now (implied by policy using role check if we wanted, 
-- but strictly by 'clinic_id' match is the baseline. 
-- Let's stick to the baseline: Clinic members can delete (or we can block it).
-- Given sensitive nature, let's RESTRICT deletion to NONE by default in this file 
-- or leave it enabled for clinic members but we usually want soft deletes.
-- Since soft delete wasn't explicitly requested in schema, we will ALLOW hard delete for now BUT 
-- strictly scoped to clinic. (User can refine this to soft delete later).
create policy "Users can delete patients in their clinic"
  on public.patients
  for delete
  using (
    clinic_id = public.get_current_clinic_id()
  );

-- 6. Indexes
create index idx_patients_clinic_id on public.patients(clinic_id);
create index idx_patients_last_name on public.patients(last_name);
create index idx_patients_email on public.patients(email);
