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
  apt update && \
  apt install cargo -y
