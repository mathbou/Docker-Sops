#!/usr/bin/env bash

# This script load all variables from the `sops.env` file in an isolated process.
# If you use this script as entrypoint, you cant access variables through `docker run` command.
# /!\ Can be difficult to make it work as sops except the command as a string.

set -Eeuo pipefail

./sops exec-env --keyservice tcp://sops:5000 ./sops.env "${@}"