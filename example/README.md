# Run the stack

```bash
bash run.sh
```

It will execute three steps:

1. It starts the sops container and get the age `public_key`.
2. It encrypts the `clean.env` into the `sops.env` file using the age `public_key`.
   - The `clean.env` is only here for the demo, only the `sops.env` should persist in a production case.
3. It starts the full stack. The bash container will echo the content of the deciphered `sops.env` file.

# How it works

This compose contains two containers:

- A modified **bash** container
  - This container mocks a service that would need some token or password given through env variables.  
  - The encrypted dotenv file is mounted into the workdir
  - A custom entrypoint script is used to call SOPS and overload the environment
- The **sops** container used for deciphering

They communicate through a dedicated docker network

# Entrypoints

Two entrypoints scripts are given as example in the `extended-bash` folder:

- `sops_env_entrypoint.sh`: Launch an isolated process using `sops exec-env`
- `sops_file_entrypoint.sh`: Overload the current env with `sops exec-file`


 