#!/bin/bash
ssl_avoid="$1"

# Conda
sudo chown -R abc /miniconda
if [ $ssl_avoid = y ] || [ $ssl_avoid = Y ]; then
    echo "ssl set to avoid"
    /miniconda/bin/conda config --set ssl_verify False 
fi
/miniconda/bin/conda update -y conda
/miniconda/bin/conda init
source ~/.bashrc
conda install -c conda-forge mamba
gpu=$(lspci | grep -i '.* vga .* nvidia .*')
if [[ $gpu == *' nvidia '* ]]; then
  echo Nvidia GPU found. Installing GPU standard env.
  mamba env create -f /setup/conda/standard_gpu_env.yaml --force
else
  echo No Nvidia GPU found. Installing standard env.
  mamba env create -f /setup/conda/standard_env.yaml --force
fi

conda activate developer

if grep -Fxq "conda activate developer" ~/.bashrc
then
    echo "conda activate developer not added to ~/.bashrc as already exists"
else 
    echo "conda activate developer" >> ~/.bashrc
fi
