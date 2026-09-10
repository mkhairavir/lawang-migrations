DROP INDEX IF EXISTS idx_cbc_client_period;

DROP TABLE IF EXISTS public.client_balance_checkpoints;

DROP INDEX IF EXISTS idx_cbm_client_created;

DROP INDEX IF EXISTS idx_cbm_client_seq;

DROP TABLE IF EXISTS public.client_balance_mutations;

ALTER TABLE public.clients DROP COLUMN IF EXISTS balance;
