-- +micrate Up
CREATE TYPE PROVIDER AS ENUM ('github', 'gitlab', 'bitbucket');

-- +micrate Down
DROP TYPE PROVIDER;
