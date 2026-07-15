ALTER TABLE public.endpoints
    DROP COLUMN IF EXISTS request_transformer_id,
    DROP COLUMN IF EXISTS log_transformer_id;
