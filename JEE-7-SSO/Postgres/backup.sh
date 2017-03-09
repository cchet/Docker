#!/bin/bash

# FILE_NAME the env var for the file name to import
if [ "$ACTION" == "EXPORT" ] 
then 
	for entry in ${DB_NAMES//,/ } ; do 
		DB_ARR=(${entry//=/ })
		pg_dump -U ${POSTGRES_USER} ${DB_ARR[0]} > /tmp/backups/${DB_ARR[0]}-$(date +"%Y%m%d_%H%M%S").backup.sql
	done
elif [ "$ACTION" == "IMPORT" ] 
then
	for entry in ${DB_NAMES//,/ } ; do 
		RESTORE_DB_ARR=(${FILE_NAME//-/ })
		DB_ARR=(${entry//=/ })
		if [ "${DB_ARR[0]}" == "${RESTORE_DB_ARR[0]}" ] 
		then
			psql -v ON_ERROR_STOP=1 -U "${POSTGRES_USER}" <<-EOSQL
				DROP DATABASE IF EXISTS ${DB_ARR[0]};
				CREATE DATABASE ${DB_ARR[0]};
				GRANT ALL PRIVILEGES ON DATABASE ${DB_ARR[0]} TO ${DB_ARR[1]};
			EOSQL
			psql -U ${POSTGRES_USER} -d ${DB_ARR[0]} < /tmp/backups/${FILE_NAME}
			exit 0
		fi
	done	
else
	exit -1
fi

exit 0