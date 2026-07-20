UPDATE transformers
SET request_transformer = response_transformer where type = 'response';

ALTER TABLE transformers DROP COLUMN IF EXISTS response_transformer;

ALTER TABLE transformers RENAME COLUMN request_transformer TO transformer;