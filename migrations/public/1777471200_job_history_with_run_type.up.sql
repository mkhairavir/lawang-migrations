ALTER TABLE job_histories 
ADD COLUMN run_type SMALLINT;

COMMENT ON COLUMN job_histories.run_type IS '0: Manual Triggered, 1: Scheduled, 2: Child Process';