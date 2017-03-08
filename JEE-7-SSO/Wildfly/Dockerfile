FROM jboss/keycloak-adapter-wildfly:2.5.4.Final
MAINTAINER herzog.thomas81@gmail.com
 
ARG PREPARE_CLI
ARG DB_DRIVER_URL
ARG START_SCRIPT

# Version Management
ENV PROJECT_STAGE DEV

USER root

RUN yum -y install wget tar dos2unix

RUN mkdir /tmp/install
RUN wget ${DB_DRIVER_URL} -O /tmp/install/db-driver.jar

COPY ${PREPARE_CLI} /tmp/install/install-offline.cli
COPY ${START_SCRIPT} /tmp/start.sh

RUN dos2unix /tmp/start.sh
RUN dos2unix /tmp/install/*.cli
RUN chmod +x /tmp/start.sh
RUN chown -R jboss:jboss /tmp/install

USER jboss

RUN ${JBOSS_HOME}/bin/jboss-cli.sh --file=/tmp/install/install-offline.cli

RUN rm -rf /tmp/install

CMD "/tmp/start.sh"

