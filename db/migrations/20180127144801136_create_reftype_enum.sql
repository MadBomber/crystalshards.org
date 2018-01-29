-- +micrate Up
CREATE TYPE REF_TYPE AS ENUM ('tag', 'branch', 'sha');

-- +micrate Down
DROP TYPE REF_TYPE;
