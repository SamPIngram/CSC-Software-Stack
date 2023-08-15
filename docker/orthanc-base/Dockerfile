FROM ubuntu:jammy

RUN \
  apt-get update --fix-missing && \
  DEBIAN_FRONTEND=noninteractive \
  apt install -y \ 
  software-properties-common \
  wget \
  curl \
  nano \
  gnupg \
  apt-transport-https && \
  wget -qO - https://debian.orthanc-labs.com/archive.key | apt-key add - && \
  apt-add-repository "deb https://debian.orthanc-labs.com/ `grep VERSION_CODENAME /etc/os-release | cut -d'=' -f 2` main" && \
  apt clean && apt update && \
  apt-get install -y \ 
  orthanc \
  orthanc-dicomweb \
  orthanc-gdcm \
  orthanc-imagej \
  orthanc-mysql \
  orthanc-postgresql \
  orthanc-python \
  orthanc-webviewer \
  orthanc-wsi \
  orthanc-stone-webviewer

COPY ./credentials.json /etc/orthanc/
COPY ./orthanc.json /etc/orthanc/

VOLUME [ "/var/lib/orthanc/db" ]
EXPOSE 4242
EXPOSE 8042

ENTRYPOINT [ "Orthanc" ]
CMD [ "/etc/orthanc/" ]