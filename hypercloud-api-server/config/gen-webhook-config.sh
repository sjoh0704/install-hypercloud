#!/bin/bash
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"
API_SERVER_HOME="${SCRIPTDIR}/hypercloud-api-server/"
export HYPERCLOUD5_CA_CERT=$(openssl base64 -A <"/etc/kubernetes/pki/hypercloud-root-ca.crt")

WEBHOOK_CONFIG_FILE=webhook-configuration.yaml
if [ -f ${API_SERVER_HOME}/config/"$WEBHOOK_CONFIG_FILE" ]; then
   echo "Remove existed webhook config file."
   rm ${API_SERVER_HOME}/config/$WEBHOOK_CONFIG_FILE
fi

echo "Generate webhook config file."
envsubst < ${API_SERVER_HOME}/config/"$WEBHOOK_CONFIG_FILE".template  > ${API_SERVER_HOME}/config/"$WEBHOOK_CONFIG_FILE"
