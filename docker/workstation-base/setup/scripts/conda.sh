#!/bin/bash
ssl_avoid="$1"

# Conda
echo Changing permissions on miniconda. This can take a while.
sudo chown -R abc /miniconda
if [ $ssl_avoid = y ] || [ $ssl_avoid = Y ]; then
    echo "ssl set to avoid"
    /miniconda/bin/conda config --set ssl_verify False 
fi
/miniconda/bin/conda update -y conda
/miniconda/bin/conda init
source ~/.bashrc
conda install -c conda-forge mamba -y
gpu=$(which nvidia-smi)
if [[ $gpu == '/usr/bin/nvidia-smi' ]]; then
  echo Nvidia GPU found. Installing GPU standard env.
  mamba env create -f /setup/conda/standard_gpu_env.yaml --prefix ~/.conda/envs/developer --force
else
  echo No Nvidia GPU found. Installing standard env.
  mamba env create -f /setup/conda/standard_env.yaml --prefix ~/.conda/envs/developer --force
fi

conda activate developer

if grep -Fxq "conda activate developer" ~/.bashrc
then
    echo "conda activate developer not added to ~/.bashrc as already exists"
else 
    echo "conda activate developer" >> ~/.bashrc
fi
