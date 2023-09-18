#!/bin/bash
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

# Themes
dconf write /org/mate/desktop/interface/gtk-theme "'Yaru-dark'"
dconf write /org/mate/desktop/background/picture-filename "'/setup/wallpaper.jpg'"

# Desktop Icons
sudo cp /usr/share/applications/mate-terminal.desktop /config/Desktop/
sudo cp /usr/share/applications/google-chrome.desktop /config/Desktop/
sudo cp /usr/share/applications/code.desktop /config/Desktop/
sudo cp /usr/share/applications/github-desktop.desktop /config/Desktop/

sudo chown -R abc /config/Desktop/

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
