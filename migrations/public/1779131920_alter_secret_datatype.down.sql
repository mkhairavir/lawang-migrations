ALTER TABLE public.secrets 
    ALTER COLUMN secret TYPE varchar(128) USING secret::varchar(128);