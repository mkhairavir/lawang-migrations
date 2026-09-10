ALTER TABLE public.clients ADD COLUMN IF NOT EXISTS balance bigint NOT NULL DEFAULT 0;

-- seq adalah urutan otoritatif mutasi, bukan created_at.
-- now() di Postgres adalah waktu mulai transaksi, sehingga dua pemotongan
-- yang menyusul bisa punya created_at yang urutannya terbalik dari urutan saldo.
CREATE TABLE IF NOT EXISTS public.client_balance_mutations (
    id text NOT NULL PRIMARY KEY,
    seq bigserial NOT NULL,
    active boolean,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone DEFAULT NULL,
    deleted_by text,
    client_id text NOT NULL,
    type text NOT NULL,
    endpoint_id text,
    gateway_id text,
    price_id text,
    note text,
    amount bigint NOT NULL,
    balance_after bigint NOT NULL
);

CREATE INDEX idx_cbm_client_seq ON public.client_balance_mutations (client_id, seq DESC);

CREATE INDEX idx_cbm_client_created ON public.client_balance_mutations (client_id, created_at);

CREATE TABLE IF NOT EXISTS public.client_balance_checkpoints (
    id text NOT NULL PRIMARY KEY,
    active boolean,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone DEFAULT NULL,
    deleted_by text,
    client_id text NOT NULL,
    period date NOT NULL,
    total_deposit bigint NOT NULL DEFAULT 0,
    total_usage bigint NOT NULL DEFAULT 0,
    hit_count bigint NOT NULL DEFAULT 0,
    closing_balance bigint NOT NULL DEFAULT 0
);

-- indeks unik ini yang membuat RollupDay idempoten
CREATE UNIQUE INDEX idx_cbc_client_period ON public.client_balance_checkpoints (client_id, period);
