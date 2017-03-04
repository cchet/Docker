FROM jboss/wildfly:10.1.0.Final
MAINTAINER herzog.thomas81@gmail.com
 
ARG PREPARE_CLI
ARG DB_DRIVER_URL
ARG START_SCRIPT

# Version Management
ENV VERSION_KEYCLOAK 2.5.4.Final
ENV VERSION_POSTGRES_JDBC 42.0.0
ENV VERSION_H2 1.4.193
ENV PROJECT_STAGE DEV

USER root

RUN yum -y install wget tar dos2unix

RUN mkdir /tmp/install
RUN wget https://downloads.jboss.org/keycloak/2.5.4.Final/adapters/keycloak-oidc/keycloak-wildfly-adapter-dist-${VERSION_KEYCLOAK}.tar.gz -O /tmp/install/keycloak-wildfly-adapter-dist.tar.gz
RUN wget ${DB_DRIVER_URL} -O /tmp/install/db-driver.jar

COPY ${PREPARE_CLI} /tmp/install/install-offline.cli
COPY ${START_SCRIPT} /tmp/start.sh

RUN dos2unix /tmp/start.sh
RUN dos2unix /tmp/install/*.cli
RUN chmod +x /tmp/start.sh
RUN tar -xzf /tmp/install/keycloak-wildfly-adapter-dist.tar.gz -C ${JBOSS_HOME}
RUN chown -R jboss:jboss /tmp/install

USER jboss

RUN ${JBOSS_HOME}/bin/jboss-cli.sh --file=${JBOSS_HOME}/bin/adapter-install-offline.cli
RUN ${JBOSS_HOME}/bin/jboss-cli.sh --file=/tmp/install/install-offline.cli

RUN rm -rf /tmp/install

CMD "/tmp/start.sh"

