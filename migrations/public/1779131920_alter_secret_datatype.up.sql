ALTER TABLE public.secrets 
    ALTER COLUMN secret TYPE text USING secret::text;

