FROM ubuntu:jammy

# Replace shell with bash 
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ARG USERNAME=qat
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER qat

# Setup QAT+ Version
ARG QAT_VERSION=v3.1.1.3

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME="/app"

RUN \
  echo "**** install runtime dependencies ****" && \
  sudo apt-get update && \
  sudo apt-get install -y \
    apt-utils \
    git \
    jq \
    libatomic1 \
    nano \
    net-tools \
    netcat \
    zip \
    tar \
    curl \
    wget \
    unzip && \
  echo "**** install code-server ****" && \
  sudo mkdir -p /app/qat && \
  sudo chown -R qat /app && \
  curl -o \
    /tmp/qat.tar.gz -L \
    "https://codeload.github.com/qatrackplus/qatrackplus/tar.gz/refs/tags/${QAT_VERSION}" && \
  tar xf /tmp/qat.tar.gz -C \
    /app/qat --strip-components=1 && \
  echo "**** clean up ****" && \
  sudo apt-get clean && \
  sudo rm -rf \
    /config/* \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*