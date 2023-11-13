FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy
# BASED ON WEBTOP
# set version label
ARG BUILD_DATE
ARG VERSION
ARG DEBIAN_FRONTEND="noninteractive"

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get install --no-install-recommends -y \
  ayatana-indicator-application \
  mate-applets \
  mate-applet-brisk-menu \
  mate-terminal \
  mate-system-monitor \
  pluma \
  wget \
  ubuntu-mate-artwork \
  ubuntu-mate-default-settings \
  ubuntu-mate-desktop \
  fonts-noto \
  ubuntu-mate-icon-themes && \
  echo "**** chrome ****" && \
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  apt -f install ./google-chrome-stable_current_amd64.deb -y && \
  rm ./google-chrome-stable_current_amd64.deb && \
  echo "**** mate tweaks ****" && \
  rm -f \
  /etc/xdg/autostart/mate-power-manager.desktop \
  /etc/xdg/autostart/mate-screensaver.desktop && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
  /config/.cache \
  /config/.launchpadlib \
  /var/lib/apt/lists/* \
  /var/tmp/* \
  /tmp/*

# CONDA
RUN \
  echo "**** install additional development packages ****" && \
  apt-get update --fix-missing && \
  apt-get install -y \ 
  bzip2 \
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


ENV PATH="PATH=/miniconda/bin:${PATH}"
ENV OPENSSL_CONF=/etc/ssl/openssl.cnf

# VS CODE
RUN \
  wget --quiet https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/vscode.deb && \
  apt install ~/vscode.deb -y && \
  rm ~/vscode.deb 

RUN \
  add-apt-repository universe -y && \
  apt update && \
  apt install dconf-cli dconf-editor -y && \
  apt install caja-open-terminal -y && \
  apt install file-roller -y && \
  wget https://github.com/shiftkey/desktop/releases/download/release-3.2.1-linux1/GitHubDesktop-linux-3.2.1-linux1.deb && \
  apt install ./GitHubDesktop-linux-3.2.1-linux1.deb -y && \
  rm GitHubDesktop-linux-3.2.1-linux1.deb

# add local files
COPY /root /
COPY /setup /setup