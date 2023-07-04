FROM ghcr.io/sampingram/csc-code-server-base:latest

RUN \
  echo "**** install additional development packages ****" && \
  apt-get update && \
  apt-get install -y \
    python3 \
    python3-pip \
    python3-tk

ENV PATH="/config/.local/bin:$PATH"