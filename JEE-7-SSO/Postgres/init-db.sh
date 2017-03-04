#!/bin/sh

# Creating users with passwords
for entry in ${DB_USERS//,/ } ; do 
	USER_ARR=(${entry//=/ })
	psql -v ON_ERROR_STOP=0 --username "${POSTGRES_USER}" <<-EOSQL
        CREATE USER ${USER_ARR[0]} WITH PASSWORD '${USER_ARR[1]}';
	EOSQL
done

# create databases and assign to user
for entry in ${DB_NAMES//,/ } ; do 
	DB_ARR=(${entry//=/ })
	psql -v ON_ERROR_STOP=0 --username "${POSTGRES_USER}" <<-EOSQL
		CREATE DATABASE ${DB_ARR[0]};
		GRANT ALL PRIVILEGES ON DATABASE ${DB_ARR[0]} TO ${DB_ARR[1]};
	EOSQL
done