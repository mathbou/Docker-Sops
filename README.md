# Docker-Sops

Ready-to-use Docker image that combine secret management tool **[SOPS
](https://github.com/getsops/sops)** and encryption tool **[age
](https://github.com/FiloSottile/age).**

[TOC]

## 🥰 Support My Work 

If you appreciate my work, consider ⭐ starring this repository or 💰 making a donation to support
future updates and maintenance.

[![](https://img.shields.io/badge/GITHUB%20SPONSOR-30363d?style=for-the-badge&logo=GitHub-Sponsors&logoColor=EA4AAA)](https://github.com/sponsors/mathbou)
[![Static Badge](https://img.shields.io/badge/STRIPE-f6f9fc?style=for-the-badge&logo=stripe)
](https://donate.stripe.com/5kQ3cn9vd0PB5EB75583C00)

## Usage

```bash
docker run registry.gitlab.com/mathbou/docker-sops:latest
```

This will start the container and do two steps:

- If it's the first start, it generates a new **age** public/private key.
- It prints the age public key.
- Start SOPS in **[keyservice](https://github.com/getsops/sops#key-service)** mode. It is exposed
  through port **5000**.

The location of the age keyfile can be modified with the
variable [SOPS_AGE_KEY_FILE](https://github.com/getsops/sops#encrypting-using-age).

### Use Case

This image is mostly useless on its own, but might come in handy in docker compose stacks.
Go check the `example` folder for a compose example.

## License

This project is licensed under [AGPLv3](https://choosealicense.com/licenses/agpl-3.0/)