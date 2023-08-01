FROM ghcr.io/sampingram/csc-code-server-base:latest

ARG PY_VERSION=3.6

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
  fi && \
  echo "#!/bin/bash\n/usr/bin/python${PY_VERSION}" > /usr/bin/python && \
  chmod +x /usr/bin/python && \
  echo "Options = UnsafeLegacyRenegotiation" >> /etc/ssl/openssl.cnf

ENV PATH="/config/.local/bin:$PATH"
