# Docker-Sops

Ready-to-use Docker image that combine secret management tool [**SOPS**](https://github.com/getsops/sops) and encryption tool [**age**](https://github.com/FiloSottile/age).

[TOC]

## Usage

```bash
docker run registry.gitlab.com/mathbou/docker-sops:latest
```

This will start the container and do two steps:
- If it's the first start, it generates a new **age** public/private key.
- It prints the age public key.
- Start SOPS in **[keyservice](https://github.com/getsops/sops#key-service)** mode. It is exposed through port **5000**.

The location of the age keyfile can be modified with the variable [SOPS_AGE_KEY_FILE](https://github.com/getsops/sops#encrypting-using-age).

### Use Case

This image is mostly useless on its own, but might come in handy in docker compose stacks.
Go check the `example` folder for a compose example.

## License

This project is licensed under [AGPLv3](https://choosealicense.com/licenses/agpl-3.0/)