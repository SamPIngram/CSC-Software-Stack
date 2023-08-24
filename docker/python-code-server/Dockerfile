FROM ghcr.io/sampingram/csc-code-server-base:latest

ARG PY_VERSION=3.11

RUN \
  echo "**** install additional development packages ****" && \
  apt-get update && \
  apt-get install -y \
    software-properties-common \
    python3-pip && \
  add-apt-repository ppa:deadsnakes/ppa -y && \
  apt-get update && \
  apt-get install -y \
    python${PY_VERSION} \
    python${PY_VERSION}-dev 
RUN \
  if [ "${PY_VERSION}" != "2.7" ]; then apt-get install -y \
    python${PY_VERSION}-venv \
    python${PY_VERSION}-distutils \
    python${PY_VERSION}-lib2to3 \
    python${PY_VERSION}-gdbm \
    python${PY_VERSION}-tk; \
  fi

# Set so python uses correct version and trusted python hosts are inplace.
RUN echo "[global]\ntrusted-host = pypi.python.org pypi.org files.pythonhosted.org" >> /etc/pip.conf && \
    echo "alias python=python${PY_VERSION}" >> /etc/bash.bashrc

COPY settings.json /config/data/Machine/
COPY install_extensions.sh /etc/cont-init.d/
ENV PATH="/config/.local/bin:$PATH"
