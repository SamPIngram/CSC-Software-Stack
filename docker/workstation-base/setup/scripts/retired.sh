#!/bin/bash

# General
sudo chown -R abc ~/

# SSL
sudo touch /etc/pip.conf 
echo "[global]" | sudo tee -a /etc/pip.conf 
echo "trusted-host = pypi.python.org pypi.org files.pythonhosted.org" | sudo tee -a /etc/pip.conf 
echo "Options = UnsafeLegacyServerConnect" | sudo tee -a /etc/ssl/openssl.cnf

# Themes
dconf write /org/mate/desktop/interface/gtk-theme "'Yaru-dark'"
dconf write /org/mate/desktop/background/picture-filename "'/setup/wallpaper.jpg'"

# Desktop Icons
sudo cp /usr/share/applications/mate-terminal.desktop /config/Desktop/
sudo cp /usr/share/applications/firefox.desktop /config/Desktop/
sudo cp /usr/share/applications/code.desktop /config/Desktop/

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
touch ~/.config/Code/User/settings.json
cp /setup/vscode/settings.json ~/.config/Code/User/settings.json
code --install-extension ms-python.python
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-toolsai.jupyter
code --install-extension ritwickdey.liveserver
code --install-extension wayou.vscode-todo-highlight
code --install-extension vscode-icons-team.vscode-icons
code --install-extension grapecity.gc-excelviewer
code --install-extension oderwat.indent-rainbow
wget -qO- https://raw.githubusercontent.com/harry-cpp/code-nautilus/master/install.sh | bash

echo -e "\n\n*****************************************"
read -p "Setup Script Completed. Press enter to exit."
