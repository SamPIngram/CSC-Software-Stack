#!/bin/bash
ssl_avoid="$1"

# VS Code
mkdir -p ~/.config/Code/User/
touch ~/.config/Code/User/settings.json
if [ $ssl_avoid = y ] || [ $ssl_avoid = Y ]; then
    echo "ssl set to avoid"
    cp /setup/vscode/settings_nossl.json ~/.config/Code/User/settings.json
else
    cp /setup/vscode/settings.json ~/.config/Code/User/settings.json
fi

code --install-extension ms-python.python
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-toolsai.jupyter
code --install-extension ritwickdey.liveserver
code --install-extension wayou.vscode-todo-highlight
code --install-extension vscode-icons-team.vscode-icons
code --install-extension grapecity.gc-excelviewer
code --install-extension oderwat.indent-rainbow
wget -qO- https://raw.githubusercontent.com/harry-cpp/code-nautilus/master/install.sh | bash