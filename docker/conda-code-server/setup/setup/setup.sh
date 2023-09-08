#!/bin/bash

# General
sudo chown -R abc ~/

# SSL
sudo touch /etc/pip.conf 
echo "[global]" | sudo tee -a /etc/pip.conf 
echo "trusted-host = pypi.python.org pypi.org files.pythonhosted.org" | sudo tee -a /etc/pip.conf 
echo "Options = UnsafeLegacyServerConnect" | sudo tee -a /etc/ssl/openssl.cnf

# Conda
sudo chown -R abc /miniconda
/miniconda/bin/conda config --set ssl_verify False
/miniconda/bin/conda update -y conda
/miniconda/bin/conda init
source ~/.bashrc
conda create --prefix ~/.conda/envs/developer -y
conda activate developer
conda install python -y
conda install ipykernel --update-deps --force-reinstall -y
echo "conda activate developer" >> ~/.bashrc

# VS Code
cp /setup/settings.json /config/data/User/settings.json
install-extension ms-python.python
install-extension ms-azuretools.vscode-docker
install-extension ms-toolsai.jupyter
install-extension ritwickdey.liveserver
install-extension wayou.vscode-todo-highlight
install-extension vscode-icons-team.vscode-icons
install-extension grapecity.gc-excelviewer
install-extension oderwat.indent-rainbow

echo -e "\n\n*****************************************"
read -p "Setup Script Completed. Press enter to exit."
