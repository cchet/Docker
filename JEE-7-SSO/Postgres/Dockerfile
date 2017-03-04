FROM postgres:9.5.6
MAINTAINER herzog.thomas81@gmail.com
LABEL description="Custom Dockerfile for adding multiple users with passwords and databases"

ADD init-db.sh /tmp/init-db.sh
RUN tr -d '\r' < /tmp/init-db.sh  > /docker-entrypoint-initdb.d/20-init-db.sh

CMD ["postgres"]