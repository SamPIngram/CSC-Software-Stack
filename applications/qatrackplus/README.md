# CSC-QATrack+ 

## Motivation

A [QATrack+](https://qatrackplus.com/) docker image supported by the CSC-Software-Stack. For quick and efficient deployment suited towards clinical networks. This deviates from the official QATrack+ docker image, by not requiring further downloads beyond the docker image which is beneficial on networks which have limited download capabilities commonly found in clinical networks. 

## Set-up

The docker image can be run using the following docker compose command:
```
docker compose up --build-arg QAT_VERSION=v3.1.1.3
```

The application is run with interactive mode enabled. If not running from localhost you will need to edit the "allowed_hosts" in the local_settings.py file located at:
```
/home/qat/web/qatrackplus/qatrack/local_settings.py
```

Update the following line in **local_settings.py** add the hostname here:

```
# Change XX.XXX.XXX.XX to your servers IP address and/or host name e.g. ALLOWED_HOSTS = ['54.123.45.1', 'yourhostname']
ALLOWED_HOSTS = ['127.0.0.1', 'localhost']
```

## Versions

[v3.1.1.3](https://docs.qatrackplus.com/en/stable/release_notes.html#qatrack-v3-1-1-3-release-notes) - Tested & Supported