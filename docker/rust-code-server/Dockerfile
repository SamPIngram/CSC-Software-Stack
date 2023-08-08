FROM ghcr.io/sampingram/csc-code-server-base:latest


RUN \
  echo "**** install additional development packages ****" && \
  apt-get update && \
  apt-get install -y \
  software-properties-common \
  build-essential \
  curl

RUN \
  echo "**** install rust ****" && \
  curl https://sh.rustup.rs -sSf | bash -s -- -y && \
  echo 'source "$HOME/.cargo/env"' >> /config/.bashrc