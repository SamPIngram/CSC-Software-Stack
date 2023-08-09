FROM ghcr.io/sampingram/csc-code-server-base:latest


RUN \
  echo "**** install additional development packages ****" && \
  apt-get update && \
  apt-get install -y \
  software-properties-common \
  build-essential \
  curl

RUN \
  echo "**** install go ****" && \
  apt-get update && \
  apt install golang-go -y