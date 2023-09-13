#!/bin/bash
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

# SSL
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
if grep -Fxq "Options = UnsafeLegacyRenegotiation" /etc/ssl/openssl.cnf
then
    echo "Options = UnsafeLegacyRenegotiation not added to /etc/ssl/openssl.cnf"
else 
    echo "Options = UnsafeLegacyRenegotiation" | sudo tee -a /etc/ssl/openssl.cnf
fi
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
