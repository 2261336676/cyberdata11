CREATE TABLE source_table (
  id INT,
  ts BIGINT,
  vc INT
) WITH (
  'connector' = 'datagen',
  'rows-per-second' = '1',
  'fields.id.kind' = 'sequence',
  'fields.id.start' = '1',
  'fields.id.end' = '1000',
  'fields.ts.kind' = 'random',
  'fields.vc.min' = '1',
  'fields.vc.max' = '100'
);

CREATE TABLE sink_table (
  id INT,
  ts BIGINT,
  vc INT
) WITH (
  'connector' = 'print'
);
INSERT INTO sink_table 
SELECT * FROM source_table;