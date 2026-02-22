CREATE TABLE IF NOT EXISTS public.audit_logs (
    id text NOT NULL,
    table_name text,
    operation_type text,
    object_id text,
    before jsonb,
    after jsonb,
    created_by text,
    created_at timestamp with time zone
);
