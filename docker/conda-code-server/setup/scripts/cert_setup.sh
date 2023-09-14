#!/bin/bash

# Change cert and cert-key paths in config.yaml if using self-certified
# Otherwise see here for other options https://coder.com/docs/code-server/latest/guide#using-a-self-signed-certificate 
# Change cert to false and remove cert-key if you want to run in http mode.

echo Before running this please check /setup/vscode/config.yaml has the correct cert paths!

read -p "Do you want to continue? (y/n) " yn1

case $yn1 in 
	[yY] ) echo ok, modifying config;
        cp /setup/vscode/config.yaml /.config/code-server/config.yaml;;
	[nN] ) echo exiting...;;
	* ) echo invalid response. exiting.;;
esac