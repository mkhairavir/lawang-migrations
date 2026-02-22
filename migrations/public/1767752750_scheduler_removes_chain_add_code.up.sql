ALTER TABLE schedulers
    ADD COLUMN code varchar(50),
    DROP COLUMN next_scheduler_id;