#!/bin/bash
set -e

./pg_ctl -D ./../data start


sleep 5


./createdb postgres
./createdb $POSTGRES_DATABASE


if [ "$POSTGRES_USER" = 'postgres' ]; then
	op='ALTER'
else
	op='CREATE'
fi

./psql --username postgres <<-EOSQL
	$op USER "$POSTGRES_USER" WITH PASSWORD '$POSTGRES_PASSWORD' ;
EOSQL

./pg_ctl -D ./../data stop

exec "$@"
