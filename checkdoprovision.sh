#!/bin/sh
PROJ=`pwd`
ansible-playbook -vvvv --check \
    ${PROJ}/provisioning/main.yml \
    --inventory-file="${PROJ}/provisioning/hosts" \
    --private-key="${PROJ}/insecure_private_key" \
    -u vagrant \
    --limit @${PROJ}/provisioning/main.retry
