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
  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.7.linux-amd64.tar.gz && \
  echo 'export PATH=$PATH:/usr/local/go/bin' >> /config/.bashrc