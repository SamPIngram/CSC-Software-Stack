FROM ghcr.io/sampingram/csc-code-server-base:latest

RUN \
  echo "**** install additional development packages ****" && \
  apt-get update && \
  apt-get install -y \
    apt-transport-https \
    wget \
    openssl \
    ca-certificates \
    gnupg && \
    gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt update && \
    apt install -y mono-devel && \
    wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm -rf packages-microsoft-prod.deb && \
    apt update && \
    apt install -y dotnet-sdk-6.0
# TODO add commands for setting up templates
RUN echo '#!/bin/bash\ncsc -r:/opt/VMS.TPS.Common.Model.API.dll -r:/opt/VMS.TPS.Common.Model.Types.dll "$@"' > /usr/bin/esapi && \
    chmod +x /usr/bin/esapi

COPY ./ESAPI_Dlls /opt