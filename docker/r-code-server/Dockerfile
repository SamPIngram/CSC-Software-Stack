FROM ghcr.io/sampingram/csc-code-server-base:latest


RUN \
  echo "**** install additional development packages ****" && \
  apt-get update && \
  apt-get install -y \
  software-properties-common \
  build-essential \
  curl


RUN \
  echo "**** install Node.JS ****" && \
  apt update && \
  apt install r-base r-base-dev -y
