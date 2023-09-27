FROM ubuntu:jammy

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# CONDA
RUN \
  echo "**** install additional development packages ****" && \
  apt-get update --fix-missing && \
  apt-get install -y \ 
  bzip2 \
  wget \
  ca-certificates \
  libglib2.0-0 \ 
  libxext6 \
  libsm6 \
  libxrender1 \
  nano \
  git \
  mercurial \
  subversion && \
  wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py311_23.5.2-0-Linux-x86_64.sh -O ~/miniconda.sh && \
  bash ~/miniconda.sh -p /miniconda -b && \
  rm ~/miniconda.sh

EXPOSE 8501

COPY run.sh /

ENTRYPOINT ["/run.sh"]