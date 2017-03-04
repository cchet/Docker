#!/bin/sh
USER_ADMIN="${ADMIN_USER?admin}"
USER_ADMIN_PASSWORD="${ADMIN_PASSWORD?admin}"

${JBOSS_HOME}/bin/add-user.sh ${ADMIN_USER} ${USER_ADMIN_PASSWORD} --silent
${JBOSS_HOME}/bin/standalone.sh --debug -b 0.0.0.0 -bmanagement 0.0.0.0

exit 0
