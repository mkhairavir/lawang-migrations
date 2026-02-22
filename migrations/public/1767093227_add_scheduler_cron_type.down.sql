ALTER TABLE schedulers
    DROP COLUMN cron_type,
    DROP COLUMN cron_script,
    DROP COLUMN cron_value,
    ADD COLUMN cron_syntax  VARCHAR(64),
