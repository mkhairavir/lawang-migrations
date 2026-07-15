ALTER TABLE public.endpoints
    ADD COLUMN IF NOT EXISTS request_transformer_id VARCHAR(64),
    ADD COLUMN IF NOT EXISTS log_transformer_id VARCHAR(64);
