DELETE FROM public.permissions WHERE menu_id = 'c1f4a5d2-93b7-4e08-8a61-2d5f7b0c9e34';

DELETE FROM public.menus WHERE id = 'c1f4a5d2-93b7-4e08-8a61-2d5f7b0c9e34';

ALTER TABLE public.endpoints DROP COLUMN IF EXISTS price_id;

DROP INDEX IF EXISTS idx_prices_name;

DROP TABLE IF EXISTS public.prices;
