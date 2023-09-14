#!/bin/bash

# Only use if vscode.sh is not able to download extensions due to ssl issues

cd /config/.vscode
rm -r /config/.vscode/extensions
wget https://github.com/SamPIngram/CSC-Software-Stack/releases/download/v0.12/extensions.zip --no-check-certificate
unzip extensions.zip
rm extensions.zip
echo "Script completed :)"