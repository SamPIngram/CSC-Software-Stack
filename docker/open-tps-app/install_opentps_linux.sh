#!/bin/bash

ENV_PATH="$PWD/OpenTPS_venv"

# Directory that contains this script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Check if the destination folder already exists
if [ -d "$ENV_PATH" ]; then
    echo "The directory $ENV_PATH already exists. If you want rerun this script, first remove this directory."
    exit 1;
fi

echo "This script will install system libraries and tools that you will need to work with OpenTPS. At several points in the installation process apt will ask you to confirm the installation and updates of packages. The script will also create a virtual python environment in the CURRENT directory named $ENV_PATH that will be used to install the python dependencies of OpenTPS."

# Install Python 3.9
apt update && apt upgrade -y
apt install software-properties-common -y
add-apt-repository ppa:deadsnakes/ppa -y
apt install python3.9 -y

# Add Python path to system environment
echo 'export PATH="/usr/bin/python3.9:$PATH"' >> ~/.bashrc
source ~/.bashrc
echo "Python 3.9 installed and path added to system environment."

# Check if Python 3.9 is installed 
if ! command -v python3.9 &>/dev/null; then
    echo "Python 3.9 is not installed. Please install it and try again."
    exit 1
fi

# Some tools we need later
apt-get install curl wget -y

# Additional system libraries (Ubuntu 19 or more recent)
apt install libmkl-rt libxcb-xinerama0 -y

cd /tmp
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB -y
sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list'
apt-get install intel-mkl-64bit-2020.1-102 -y
echo 'export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:$LD_LIBRARY_PATH' | sudo tee -a /etc/profile.d/mkl_lib.sh

# install poetry
# curl -sSL https://install.python-poetry.org | python3 -

# Create a virtual environment
apt-get install python3.9-venv -y
python3.9 -m venv $ENV_PATH

# Activate the virtual environment
$ENV_PATH/bin/activate
echo "Virtual environment 'OpenTPS_venv' created"

# Upgrade pip
pip3 install --upgrade pip

# Install required Python packages
pip3 install pydicom
pip3 install numpy
pip3 install scipy 
pip3 install matplotlib 
pip3 install Pillow
pip3 install PyQt5==5.15.7 
pip3 install pyqtgraph
pip3 install sparse_dot_mkl 
pip3 install vtk==9.2.6
pip3 install SimpleITK
pip3 install pandas
pip3 install scikit-image 
pip3 install tensorflow
pip3 install keras
pip3 install pymedphys==0.39.3
# pip3 install cupy

echo
echo "Installation complete. You can start opentps with"
echo "   bash $SCRIPT_DIR/start_opentps_linux.sh"
echo "You have to be in the directory where you ran the install script."