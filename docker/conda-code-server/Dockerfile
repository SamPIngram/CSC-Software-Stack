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
  wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py311_23.5.2-0-Linux-x86_64.sh -O ~/miniconda.sh && \
  bash ~/miniconda.sh -p /miniconda -b && \
  rm ~/miniconda.sh

ENV PATH="PATH=/miniconda/bin:${PATH}"
ENV OPENSSL_CONF=/etc/ssl/openssl.cnf

RUN /miniconda/bin/conda update -y conda && \
    /miniconda/bin/conda init && \
    chown -R abc /miniconda && \
    echo "Options = UnsafeLegacyRenegotiation" >> /etc/ssl/openssl.cnf
