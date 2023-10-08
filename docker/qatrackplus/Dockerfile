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
ENV HOME="/home/qat"

RUN \
  echo "**** install runtime dependencies ****" && \
  sudo apt-get update && \
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
    unzip \
    make \
    build-essential \
    python3-dev \
    python3-tk \
    python3-venv \
    postgresql \
    libpq-dev \
    postgresql-client \
    postgresql-client-common
  
RUN \
  echo "**** download QAT+ ****" && \
  mkdir -p ~/web && \
  cd ~/web && \
  git clone https://github.com/qatrackplus/qatrackplus.git && \
  cd qatrackplus && \
  git checkout ${QAT_VERSION} 


USER root

COPY pg_hba.conf /root/pg_hba.conf
RUN \
  echo "**** setup QAT+ DB ****" && \
  /etc/init.d/postgresql start && \
  sudo -u postgres psql < /home/qat/web/qatrackplus/deploy/postgres/create_db_and_role.sql && \
  sudo -u postgres psql < /home/qat/web/qatrackplus/deploy/postgres/create_ro_role.sql && \
  cp /root/pg_hba.conf /etc/postgresql/14/main/pg_hba.conf && \
  rm /root/pg_hba.conf && \
  sudo service postgresql restart

USER qat

RUN echo "**** setup QAT+ Python ****" && \
  mkdir -p ~/venvs && \
  python3 -m venv ~/venvs/qatrack31 && \
  source ~/venvs/qatrack31/bin/activate && \
  pip install --upgrade pip && \
  cd ~/web/qatrackplus && \
  pip install -r requirements/postgres.txt

# RUN \
#   echo "**** clean up ****" && \
#   sudo apt-get clean && \
#   sudo rm -rf \
#     /config/* \
#     /tmp/* \
#     /var/lib/apt/lists/* \
#     /var/tmp/*