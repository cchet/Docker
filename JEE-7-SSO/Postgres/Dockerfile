FROM postgres:9.5.6
MAINTAINER herzog.thomas81@gmail.com
LABEL description="Custom Dockerfile for adding multiple users with passwords and databases"

RUN mkdir /tmp/backups
ADD init-db.sh /tmp/init-db.sh
ADD backup.sh /tmp/backup.sh
RUN tr -d '\r' < /tmp/init-db.sh  > /docker-entrypoint-initdb.d/20-init-db.sh
RUN tr -d '\r' < /tmp/backup.sh  > /tmp/backup.sh

CMD ["postgres"]