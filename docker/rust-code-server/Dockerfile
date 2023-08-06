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
  apt-get update && \
  curl https://sh.rustup.rs -sSf | bash -s -- -y && \
  echo 'source /root/.cargo/env' >> /config/.bashrc