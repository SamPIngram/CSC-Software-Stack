FROM ubuntu:jammy

RUN \
  apt-get update --fix-missing && \
  apt-get install -y \ 
  orthanc \
  orthanc-dicomweb \
  orthanc-gdcm \
  orthanc-imagej \
  orthanc-mysql \
  orthanc-postgresql \
  orthanc-python \
  orthanc-webviewer \
  orthanc-wsi

COPY ./credentials.json /etc/orthanc/
COPY ./orthanc.json /etc/orthanc/

VOLUME [ "/var/lib/orthanc/db" ]
EXPOSE 4242
EXPOSE 8042

ENTRYPOINT [ "Orthanc" ]
CMD [ "/etc/orthanc/" ]