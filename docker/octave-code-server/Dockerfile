# STATUS >> Need to resolve permissions on conda install

FROM ghcr.io/sampingram/csc-code-server-base:latest

ARG OCTAVE_VER=7.3.0

RUN \
  echo "**** install additional octave dependancies ****" && \
  apt-get update --fix-missing && \
  apt-get install -y \ 
  software-properties-common \
  wget \
  bzip2 \
  ca-certificates \
  gcc \
  g++ \
  autoconf \
  automake \
  bison \
  dvipng \
  epstool \
  fig2dev \
  flex \
  gfortran \
  gnuplot-x11 \
  gperf \
  gzip \
  icoutils \
  libarpack2-dev \
  libbison-dev \
  libopenblas-dev \
  libcurl4-gnutls-dev \
  libfftw3-dev \
  libfltk1.3-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libgl1-mesa-dev \
  libgl2ps-dev \
  libglpk-dev \
  libgraphicsmagick++1-dev \
  libhdf5-dev \
  liblapack-dev \
  libosmesa6-dev \
  libpcre3-dev \
  libqhull-dev \
  libqscintilla2-qt5-dev \
  libqrupdate-dev \
  libreadline-dev \
  librsvg2-bin \
  libsndfile1-dev \
  libsuitesparse-dev \
  libsundials-dev \
  libtool \
  libxft-dev \
  make \
  openjdk-8-jdk \
  perl \
  portaudio19-dev \
  pstoedit \
  qtbase5-dev \
  qttools5-dev \
  qttools5-dev-tools \
  rapidjson-dev \
  rsync \
  tar \
  texinfo \
  texlive-latex-extra \
  zlib1g-dev \
  lzip

RUN \
  echo "**** build octave ****" && \
  DEBIAN_FRONTEND=noninteractive apt update -y \
  && wget https://ftpmirror.gnu.org/octave/octave-${OCTAVE_VER}.tar.lz \
  && tar -xvf octave-${OCTAVE_VER}.tar.lz \
  && cd octave-${OCTAVE_VER} \
  && ./configure --prefix=/usr/local/OCTAVE/${OCTAVE_VER} --enable-64 \
  && make -j$(nproc) \
  && make install \
  && cd .. \
  && rm -r octave-${OCTAVE_VER}.tar.lz \
  echo "alias octave=/octave-${OCTAVE_VER}/run-octave" >> /root/.bashrc 