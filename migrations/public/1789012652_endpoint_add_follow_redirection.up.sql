ALTER TABLE public.endpoints ADD COLUMN IF NOT EXISTS follow_redirection boolean DEFAULT false;
