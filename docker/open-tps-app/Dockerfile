FROM ubuntu:jammy

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1920 \
    DISPLAY_HEIGHT=1080 \ 
    TZ=etc/UTC 

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
    bash \
    fluxbox \
    git \
    net-tools \
    novnc \
    supervisor \
    x11vnc \
    xterm \
    xvfb \
    tzdata \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6 

# Install Python 3.9
RUN apt-get install -y \
    software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update; \
    apt-get install -y \
    python3.9 \
    python3-pip \
    python3.9-venv- \
    python3.9-dev \
    python3.9-distutils \
    python3.9-lib2to3 \
    python3.9-gdbm \
    python3.9-tk

# clone opentps repo and install
RUN mkdir -p /app \
    git clone https://gitlab.com/openmcsquare/opentps.git /app/opentps \
    cd /app/opentps \
    install_opentps_linux.sh \
    chmod +x /app/opentps/start_opentps_linux.sh

COPY . /app
CMD ["/app/entrypoint.sh"]
EXPOSE 8080