#!/usr/bin/env bash

# This script load and export all variables from the `sops.env` file.
# If you use this script as entrypoint, deciphered variables may be accessible from outside the container through `docker run` command

set -Eeuo pipefail

export $(./sops exec-file --keyservice tcp://sops:5000 ./sops.env "cat {}" | grep -v '^#' | xargs)

exec "${@}"