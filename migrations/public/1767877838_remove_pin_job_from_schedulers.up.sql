ALTER TABLE schedulers
    ADD COLUMN server_id varchar(50),
    DROP COLUMN pin_job;