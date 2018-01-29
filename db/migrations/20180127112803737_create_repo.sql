-- +micrate Up
CREATE TABLE repos (
  id BIGSERIAL PRIMARY KEY,
  provider PROVIDER NOT NULL,
  owner VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  stars INT,
  issues INT,
  weekly_clones INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- +micrate Down
DROP TABLE IF EXISTS repos;
