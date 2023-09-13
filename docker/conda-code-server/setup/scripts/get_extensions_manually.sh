#!/bin/bash

# Only use if vscode.sh is not able to download extensions due to ssl issues

cd /config/
rm -r /config/extensions
wget https://github.com/SamPIngram/CSC-Software-Stack/releases/download/v0.12/extensions.zip --no-check-certificate
unzip extensions.zip
echo "Script completed :)"