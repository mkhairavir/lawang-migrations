ALTER TABLE transformers RENAME COLUMN transformer TO request_transformer;

ALTER TABLE transformers ADD COLUMN IF NOT EXISTS response_transformer TEXT;

UPDATE transformers
SET response_transformer = request_transformer, request_transformer = '' where type = 'response';