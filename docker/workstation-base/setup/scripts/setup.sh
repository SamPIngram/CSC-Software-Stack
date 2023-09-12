#!/bin/bash

# General
sudo chown -R abc ~/

# SSL
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
read -p "Do you want to add ssl avoidance? (y/n) " yn1

case $yn1 in 
	[yY] ) echo ok, adding ssl avoidance;
        /bin/bash /setup/scripts/ssl_avoid.sh;;
	[nN] ) echo skipping ssl avoidance...;;
	* ) echo invalid response. moving on.;;
esac
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
# Themes
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
read -p "Do you want to set default CSC themes? (y/n) " yn2

case $yn2 in 
	[yY] ) echo ok, setting themes;
    /bin/bash /setup/scripts/themes.sh;;
	[nN] ) echo skipping themes...;;
	* ) echo invalid response. moving on.;;
esac
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
# Conda
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
read -p "Do you want to setup default conda env? (y/n) " yn3

case $yn3 in 
	[yY] ) echo ok, adding conda env;
    /bin/bash /setup/scripts/conda.sh $yn1;;
	[nN] ) echo skipping conda env setup...;;
	* ) echo invalid response. moving on.;;
esac
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
# VS Code
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
read -p "Do you want to setup vs code? (y/n) " yn4

case $yn4 in 
	[yY] ) echo ok, setting up vscode;
    /bin/bash /setup/scripts/vscode.sh $yn1;;
	[nN] ) echo skipping vscode setup...;;
	* ) echo invalid response. moving on.;;
esac
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =

echo "Script completed :)"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
