CREATE TABLE IF NOT EXISTS public.gateways (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    version_id text,
    path text,
    backend_id text,
    endpoint_id text,
    is_deployed boolean,
    last_deployment_date timestamp with time zone,
    backend_type text
);
CREATE INDEX IF NOT EXISTS idx_is_deployed_active ON public.gateways USING btree (active, is_deployed);
