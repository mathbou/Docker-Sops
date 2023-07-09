# syntax=docker/dockerfile:1.4

FROM alpine:latest as downloader

ARG SOPS_V="3.7.3"
ARG AGE_V="1.1.1"
ARG PLATFORM="amd64"

WORKDIR /tmp

RUN apk add curl tar

RUN <<EOT
curl -L "https://github.com/getsops/sops/releases/download/v${SOPS_V}/sops-v${SOPS_V}.linux.${PLATFORM}" -o ./sops &&
chmod +x ./sops
EOT

RUN <<EOT
set -e
# AGE KEYGEN
curl -L "https://github.com/FiloSottile/age/releases/download/v${AGE_V}/age-v${AGE_V}-linux-${PLATFORM}.tar.gz" -o ./age.tar.gz &&
tar -xzvf ./age.tar.gz "age/age-keygen" --strip-components 1
rm ./age.tar.gz
chmod +x ./age-keygen
EOT

FROM bash:latest
LABEL maintainer="Mathieu Bouzard <mathieu.bouzard@gmail.com>"

ENV SOPS_AGE_KEY_FILE=/home/age/keys.txt

COPY --from=downloader /tmp ./

COPY entrypoint.sh .

EXPOSE 5000

ENTRYPOINT ["bash", "entrypoint.sh"]
CMD ["keyservice", "--verbose", "--addr", "0.0.0.0:5000", "--network", "tcp"]