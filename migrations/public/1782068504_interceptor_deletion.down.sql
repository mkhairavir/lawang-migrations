BEGIN;

CREATE TABLE public.interceptors (
	id text NOT NULL,
	active bool NULL,
	created_at timestamptz NULL,
	updated_at timestamptz NULL,
	created_by text NULL,
	updated_by text NULL,
	deleted_at timestamptz NULL,
	deleted_by text NULL,
	"name" text NULL,
	javascript text NULL,
	CONSTRAINT interceptors_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX idx_interceptors_name ON public.interceptors USING btree (name);

COMMIT;