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
  echo "**** add chrome for reporting ****" && \
  cd /home/qat/ && \
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  sudo apt install ./google-chrome-stable_current_amd64.deb -y && \
  rm ./google-chrome-stable_current_amd64.deb

RUN \
  echo "**** download QAT+ ****" && \
  mkdir -p /home/qat/web && \
  cd /home/qat/web && \
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
# Allow Numpy, Scipy and Pillow to use later versions as very old dreprecated versions don't build
COPY base.txt /home/qat/web/qatrackplus/requirements/base.txt
RUN echo "**** setup QAT+ Python ****" && \
  mkdir -p /home/qat/venvs && \
  python3 -m venv /home/qat/venvs/qatrack31 && \
  source /home/qat/venvs/qatrack31/bin/activate && \
  pip install --upgrade pip && \
  cd /home/qat/web/qatrackplus && \
  pip install -r requirements.txt && \
  echo "source /home/qat/venvs/qatrack31/bin/activate" >> ~/.bashrc


RUN echo "**** Configure QAT+  ****" && \
  cd /home/qat/web/qatrackplus && \
  source /home/qat/venvs/qatrack31/bin/activate && \
  cp deploy/postgres/local_settings.py qatrack/local_settings.py && \
  sudo service postgresql start && \
  python manage.py showmigrations accounts && \
  python manage.py migrate && \
  python manage.py loaddata fixtures/defaults/*/* && \
  python manage.py createsuperuser --noinput --username admin --email admin@admin.com && \
  python manage.py createcachetable && \
  python manage.py collectstatic

USER root

RUN \
  service postgresql start 

USER qat


# RUN \
#   echo "**** clean up ****" && \
#   sudo apt-get clean && \
#   sudo rm -rf \
#     /config/* \
#     /tmp/* \
#     /var/lib/apt/lists/* \
#     /var/tmp/*