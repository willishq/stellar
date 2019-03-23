#!/bin/bash

set -e

pgsql -v ON_ERROR_STOP=1 --username  "$POSTGRES_USER" --dbname  "$POSTGRES_PASSWORD" <<- EOSQL
    CREATE USER ${POSTGRES_TEST_USER} WITH ENCRYPTED PASSWORD '${POSTGRES_TEST_PASSWORD}';
    CREATE DATABASE ${POSTGRES_TEST_DB};
    GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_TEST_DB} TO ${POSTGRES_TEST_USER};
EOSQL
