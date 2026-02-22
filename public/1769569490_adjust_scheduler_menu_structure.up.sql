ALTER TABLE schedulers RENAME TO jobs;

ALTER TABLE jobs
    DROP COLUMN cron_script,
    ADD COLUMN schedule_id VARCHAR(50);