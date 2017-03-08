#!/bin/bash

# FILE_NAME the env var for the file name to import
if [ "$ACTION" == "EXPORT" ] 
then 
	for entry in ${DB_NAMES//,/ } ; do 
		DB_ARR=(${entry//=/ })
		pg_dump -U postgres ${DB_ARR[0]} > /tmp/backups/${DB_ARR[0]}-$(date +"%Y%m%d_%H%M%S").backup.sql
	done
elif [ "$ACTION" == "IMPORT" ] 
then
	DB_ARR=(${FILE_NAME//-/ })
	psql -U postgres -d ${DB_ARR[0]} < /tmp/backups/${FILE_NAME}
else
	exit -1
fi

exit 0