#!/bin/sh
PROJ=`pwd`
ansible-playbook -v \
    ${PROJ}/provisioning/main.yml \
    --inventory-file="${PROJ}/provisioning/hosts" \
    --private-key="./insecure_private_key" \
    -u vagrant \
    --limit @${PROJ}/provisioning/main.retry
