ALTER TABLE schedulers
    DROP COLUMN code,
    ADD COLUMN next_scheduler_id varchar(64);