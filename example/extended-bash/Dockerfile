# syntax=docker/dockerfile:1.4

FROM alpine/curl:latest as downloader

ARG SOPS_V="3.7.3"
ARG PLATFORM="amd64"

WORKDIR /tmp

RUN curl -L "https://github.com/getsops/sops/releases/download/v${SOPS_V}/sops-v${SOPS_V}.linux.${PLATFORM}" -o ./sops

# ------------- Add sops and custom entrypoint into the bash image

FROM bash:5.2

COPY --from=downloader /tmp/sops .
COPY sops_file_entrypoint.sh .

RUN chmod +x ./sops ./sops_file_entrypoint.sh

ENTRYPOINT ["./sops_file_entrypoint.sh", "/usr/local/bin/docker-entrypoint.sh"]
