ALTER TABLE schedulers
    ADD COLUMN cron_type varchar(10),
    ADD COLUMN cron_value varchar(64),
    ADD COLUMN cron_script varchar(64),
    DROP COLUMN cron_syntax;