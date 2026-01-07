ALTER TABLE IF EXISTS ONLY public.schedulers DROP CONSTRAINT IF EXISTS schedulers_pkey;

DROP TABLE IF EXISTS public.schedulers;

ALTER TABLE public.server_settings
    DROP COLUMN IF EXISTS log_scheduler_path,
    DROP COLUMN IF EXISTS log_scheduler_max_size,
    DROP COLUMN IF EXISTS log_scheduler_max_backups,
    DROP COLUMN IF EXISTS log_scheduler_max_age,
    DROP COLUMN IF EXISTS log_scheduler_compress;

ALTER TABLE public.servers
    DROP COLUMN IF EXISTS set_as_scheduler;