ALTER TABLE public.job_histories
    DROP COLUMN IF EXISTS total,
    DROP COLUMN IF EXISTS processed;
