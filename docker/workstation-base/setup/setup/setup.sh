#!/bin/bash

# Themes
dconf write /org/mate/desktop/interface/gtk-theme "'Yaru-dark'"
dconf write /org/mate/desktop/background/picture-filename "'/setup/84136.jpg'"

# Desktop Icons
cp /usr/share/applications/mate-terminal.desktop /config/Desktop
cp /usr/share/applications/firefox.desktop /config/Desktop
cp /usr/share/applications/code.desktop /config/Desktop

# Conda
/miniconda/bin/conda update -y conda
/miniconda/bin/conda init
source ~/.bashrc
conda create -n developer -y
conda activate developer
conda install python -y
conda install ipykernel --update-deps --force-reinstall -y
echo "conda activate developer" >> ~/.bashrc

# VS Code
code --install-extension ms-python.python
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-toolsai.jupyter
code --install-extension ritwickdey.liveserver
code --install-extension wayou.vscode-todo-highlight
code --install-extension vscode-icons-team.vscode-icons
code --install-extension grapecity.gc-excelviewer
code --install-extension oderwat.indent-rainbow
cp /setup/settings.json ~/.config/Code/User/settings.json

echo -e "\n\n*****************************************"
read -p "Setup Script Completed. Press enter to exit."