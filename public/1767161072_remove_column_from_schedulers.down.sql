ALTER TABLE schedulers
    ADD COLUMN cron_type varchar(10),
    ADD COLUMN cron_value varchar(64);