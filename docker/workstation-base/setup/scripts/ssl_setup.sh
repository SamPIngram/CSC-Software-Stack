#!/bin/bash

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -


# pip trusted resources
sudo touch /etc/pip.conf 
if grep -Fxq "[global]" /etc/pip.conf 
then
    echo "[global] not added to /etc/pip/.conf as already exists"
else 
    echo "[global]" | sudo tee -a /etc/pip.conf 
fi
if grep -Fxq "trusted-host = pypi.python.org pypi.org files.pythonhosted.org" /etc/pip.conf 
then
    echo "trusted-hosts not added to /etc/pip/.conf as already exists"
else 
    echo "trusted-host = pypi.python.org pypi.org files.pythonhosted.org" | sudo tee -a /etc/pip.conf 
fi
if grep -Fxq "cert = /config/ssl/cert.pem" /etc/pip.conf 
then
    echo "cert not added to /etc/pip/.conf as already exists"
else 
    echo "cert = /config/ssl/cert.pem" | sudo tee -a /etc/pip.conf 
fi

# conda ssl
cp /config/ssl/cert.pem /miniconda/ssl/cert.pem

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
