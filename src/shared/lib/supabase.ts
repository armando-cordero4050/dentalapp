import { createClient } from '@supabase/supabase-js'

// Supabase configuration stub
// TODO: Replace with actual Supabase project credentials
const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL || 'https://placeholder.supabase.co'
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY || 'placeholder-key'

// Create Supabase client
export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)

// Supabase client is ready for future use
// No database calls are made here - this is just the client initialization
