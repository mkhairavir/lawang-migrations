DELETE FROM permissions p
USING menus m
WHERE p.menu_id = m.id
  AND m.id IN ('e1414578-ecbf-492c-b5d0-5fe515d5ebda', 'd7eadd5e-0070-40ff-8d2f-2118ca62e631');

DELETE FROM menus
WHERE id IN ('e1414578-ecbf-492c-b5d0-5fe515d5ebda', 'd7eadd5e-0070-40ff-8d2f-2118ca62e631');

ALTER TABLE jobs
    DROP COLUMN schedule_id,
    ADD COLUMN cron_script VARCHAR(64);

DROP TABLE IF EXISTS public.schedules;

ALTER TABLE jobs RENAME TO schedulers;