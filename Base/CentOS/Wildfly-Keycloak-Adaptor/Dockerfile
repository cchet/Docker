FROM jboss-wildfly-oracle-jdk8

ARG KEYCLOAK_VERSION

WORKDIR /opt/jboss/wildfly

RUN wget https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/adapters/keycloak-oidc/keycloak-wildfly-adapter-dist-$KEYCLOAK_VERSION.tar.gz
RUN tar -zxf ./keycloak-wildfly-adapter-dist-$KEYCLOAK_VERSION.tar.gz
RUN ./bin/jboss-cli.sh --file=./bin/adapter-install-offline.cli