# CSC-QATrack+ 

A docker image supported by the CSC-Software-Stack. For quick and efficient deployment suited towards clinical networks. This deviates from the official QATrack+ docker image, by not requiring further downloads beyond the docker image which is beneficial on networks which have limited download capabilities commonly found in clinical networks. 

The application is run with interactive mode enabled. If not running from localhost you will need to edit the "allowed_hosts" in the local_settings.py file. 