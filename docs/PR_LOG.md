# PR_LOG — DentalFlow / dentalapp

Registro operativo por PR. Cada PR agrega una entrada nueva abajo.
Regla: no borrar entradas; si algo se corrige, se agrega una nota en el PR siguiente.

---

## PR #1 — Bootstrap / estructura base
**Fecha:** 2025-12-24  
**Objetivo:** Arrancar proyecto React+Vite+TS, estructura modular, docs base.  
**Cambios:**
- Setup inicial del repo y estructura `src/app`, `src/modules`, `src/shared`.
- Documentación base y UI kit inicial.
**Verificación:**
- Build OK
- Lint OK
**Riesgos:** bajos  
**Notas:** N/A

---

## PR #3 — Supabase Foundation
**Fecha:** 2025-12-24
**Objetivo:** Implementar base de datos Supabase (Tablas Core + RLS) y Auth Client.
**Cambios:**
- DB: Tablas `clinics`, `profiles`, `roles`, `permissions`.
- DB: Policies RLS multi-tenant estrictas.
- DB: Función `get_current_clinic_id`.
- Front: `AuthContext` y `useSession`.
**Verificación:**
- SQL revisado contra decisión de multi-tenancy.
- Build OK.
**Riesgos:** Crítico (Base de seguridad).
**Notas:** No se implementó lógica de negocio aún.

---

## PR #4 — Patients Schema (Strict DB)
**Fecha:** 2025-12-24
**Objetivo:** Implementar esquema de tabla `patients` con revisión estricta (ADR-0009).
**Cambios:**
- DB: Tabla `patients` con `clinic_id`, constraints y enum `gender`.
- DB: RLS policies (CRUD scopeado a `clinic_id`).
- DB: Índices para búsqueda.
- DB: Trigger `updated_at`.
**Verificación:**
- Revisión manual de SQL cumpliendo `clinic_id` en todo.
- Constraints únicos por clínica correctos.
**Riesgos:** Pérdida de integridad si RLS falla (mitigado por test visual).
**Notas:** Solo Schema, sin UI.



---

## PR #__ — <título>
**Fecha:** YYYY-MM-DD  
**Objetivo:**  
**Cambios:**  
**Decisiones tomadas (si aplica):**  
**Verificación:**  
- Build:
- Lint:
- Tests:
**Riesgos / pendientes:**  
**Notas:**
