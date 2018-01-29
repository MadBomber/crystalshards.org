-- +micrate Up
CREATE TABLE repo_versions (
  id BIGSERIAL PRIMARY KEY,
  repo_id BIGINT NOT NULL REFERENCES repos,
  ref_type REF_TYPE NOT NULL,
  ref VARCHAR NOT NULL,
  spec JSONB,
  documentation JSONB,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


-- +micrate Down
DROP TABLE IF EXISTS repo_versions;
