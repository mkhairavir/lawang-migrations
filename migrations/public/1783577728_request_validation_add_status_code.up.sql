ALTER TABLE public.request_validators
    ADD COLUMN IF NOT EXISTS status_code INT8;
