-- +micrate Up
CREATE TABLE contributors (
  id BIGSERIAL PRIMARY KEY,
  provider PROVIDER,
  username VARCHAR,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


-- +micrate Down
DROP TABLE IF EXISTS contributors;
