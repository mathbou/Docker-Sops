#!/usr/bin/env bash

# Get the age public key
public_key=$(docker compose run --rm sops -v | grep "public" | rev | cut -d" " -f1 | rev)

# Encrypt the clean.env file using the age public key
tail -n +2 <<< $(docker compose run --rm -v "$(pwd)/clean.env:/clean.env" sops -e --age ${public_key} /clean.env) > sops.env

# Run the full stack, it should show deciphered variables in the terminal
docker compose up --exit-code-from bash-with-sops