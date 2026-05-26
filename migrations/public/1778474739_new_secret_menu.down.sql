DELETE FROM public.permissions 
WHERE menu_id = 'a175b88e-1611-444f-9532-8390172bb335';

DELETE FROM public.menus 
WHERE id = 'a175b88e-1611-444f-9532-8390172bb335';

DROP TABLE IF EXISTS public.secrets;