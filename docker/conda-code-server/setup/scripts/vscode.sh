#!/bin/bash
ssl_avoid="$1"

# VS Code
mkdir -p /config/data/User/
touch /config/data/User/settings.json
if [ $ssl_avoid = y ] || [ $ssl_avoid = Y ]; then
    echo "ssl set to avoid"
    cp /setup/vscode/settings_nossl.json /config/data/User/settings.json
else
    cp /setup/vscode/settings.json /config/data/User/settings.json
fi

cp /setup/vscode/settings_machine.json /config/data/Machine/settings.json

install-extension ms-python.python
install-extension ms-azuretools.vscode-docker
install-extension ms-toolsai.jupyter
install-extension ritwickdey.liveserver
install-extension wayou.vscode-todo-highlight
install-extension vscode-icons-team.vscode-icons
install-extension grapecity.gc-excelviewer
install-extension oderwat.indent-rainbow