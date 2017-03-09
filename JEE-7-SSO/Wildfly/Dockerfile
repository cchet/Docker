FROM jboss-wildfly-keycloak-oracle-jdk8
MAINTAINER herzog.thomas81@gmail.com
 
ARG PREPARE_CLI
ARG DB_DRIVER_URL
ARG START_SCRIPT

# Version Management
ENV PROJECT_STAGE DEV

WORKDIR /tmp

RUN wget ${DB_DRIVER_URL} -O ./db-driver.jar

COPY ${PREPARE_CLI} install-offline.cli
COPY ${START_SCRIPT} start.sh

USER root 

RUN dos2unix *.sh
RUN dos2unix *.cli
RUN chmod +x start.sh

USER jboss 
 
RUN ${JBOSS_HOME}/bin/jboss-cli.sh --file=/tmp/install-offline.cli

CMD "/tmp/start.sh"

