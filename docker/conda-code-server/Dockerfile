# STATUS >> Need to resolve permissions on conda install

FROM ghcr.io/sampingram/csc-code-server-base:latest

RUN \
  echo "**** install additional development packages ****" && \
  apt-get update --fix-missing && \
  apt-get install -y \ 
  wget \
  bzip2 \
  ca-certificates \
  libglib2.0-0 \ 
  libxext6 \
  libsm6 \
  libxrender1 \
  git \
  mercurial \
  subversion && \
  wget --quiet https://repo.anaconda.com/miniconda/Miniconda2-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh

 
# ENV PATH="./opt/conda/etc/profile.d/conda.sh"
# ENV PATH="conda activate base"

