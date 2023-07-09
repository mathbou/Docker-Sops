#!/usr/bin/env bash

mkdir -p $(dirname ${SOPS_AGE_KEY_FILE} )

if [[ -f ${SOPS_AGE_KEY_FILE} ]]; then
    cat ${SOPS_AGE_KEY_FILE} | grep "public"
else
    ./age-keygen -o ${SOPS_AGE_KEY_FILE}
fi

./sops ${@}