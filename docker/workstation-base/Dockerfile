FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy
# BASED ON WEBTOP
# set version label
ARG BUILD_DATE
ARG VERSION
ARG DEBIAN_FRONTEND="noninteractive"

# prevent Ubuntu's firefox stub from being installed
COPY /root/etc/apt/preferences.d/firefox-no-snap /etc/apt/preferences.d/firefox-no-snap

RUN \
  echo "**** install packages ****" && \
  add-apt-repository -y ppa:mozillateam/ppa && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get install --no-install-recommends -y \
    ayatana-indicator-application \
    firefox \
    mate-applets \
    mate-applet-brisk-menu \
    mate-terminal \
    mate-system-monitor \
    pluma \
    ubuntu-mate-artwork \
    ubuntu-mate-default-settings \
    ubuntu-mate-desktop \
    ubuntu-mate-icon-themes && \
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

RUN DEBIAN_FRONTEND=noninteractive \
    /miniconda/bin/conda update -y conda && \
    /miniconda/bin/conda init && \
    chown -R abc /miniconda && \
    echo "Options = UnsafeLegacyRenegotiation" >> /etc/ssl/openssl.cnf

# VS CODE
RUN \
  wget --quiet https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/vscode.deb && \
  apt install ~/vscode.deb -y && \
  rm ~/vscode.deb 

# add local files
COPY /root /
COPY ./setup.sh /config/Desktop

# ports and volumes
EXPOSE 3000
VOLUME /config

RUN \
  export DISPLAY=:0 && \
  export $(dbus-launch) && \
  cp /usr/share/applications/mate-terminal.desktop /config/Desktop && \
  cp /usr/share/applications/firefox.desktop /config/Desktop && \
  cp /usr/share/applications/code.desktop /config/Desktop && \ 
  add-apt-repository universe && \
  apt update && \
  apt install dconf-cli dconf-editor -y && \
  dconf write /org/mate/desktop/interface/gtk-theme "'Yaru-dark'" && \
  apt install caja-open-terminal -y 

