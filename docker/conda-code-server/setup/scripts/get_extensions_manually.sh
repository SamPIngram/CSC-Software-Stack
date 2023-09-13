#!/bin/bash

# Only use if vscode.sh is not able to download extensions due to ssl issues

cd /config/
rm -r /config/extensions
git clone https://github.com/SamPIngram/code-server-extensions.git extensions

echo "Script completed :)"