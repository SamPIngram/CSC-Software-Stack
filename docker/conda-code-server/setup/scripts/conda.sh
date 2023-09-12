#!/bin/bash
ssl_avoid="$1"

# Conda
echo Changing permissions on miniconda. This can take a while.
sudo chown -R abc /miniconda
if [ $ssl_avoid = y ] || [ $ssl_avoid = Y ]; then
    echo "ssl set to avoid"
    /miniconda/bin/conda config --set ssl_verify False 
fi

/miniconda/bin/conda init
# Some reason mamba is not happy to install in base. So make tmp env.
# Also source ~/.bashrc doesn't work so need to manually init here
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/miniconda/etc/profile.d/conda.sh" ]; then
        . "/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda create -n tmp_builder -y
conda activate tmp_builder
conda install -c conda-forge mamba -y

gpu=$(lspci | grep -i '.* vga .* nvidia .*')
if [[ $gpu == *' nvidia '* ]]; then
  echo Nvidia GPU found. Installing GPU standard env.
  mamba env create -f /setup/conda/standard_gpu_env.yaml --prefix ~/.conda/envs/developer --force
else
  echo No Nvidia GPU found. Installing standard env.
  mamba env create -f /setup/conda/standard_env.yaml --prefix ~/.conda/envs/developer --force
fi
# If mamba doesn't work due to libarchive.so.13. Install mamaba into fresh miniconda env.
conda activate developer

if grep -Fxq "conda activate developer" ~/.bashrc
then
    echo "conda activate developer not added to ~/.bashrc as already exists"
else 
    echo "conda activate developer" >> ~/.bashrc
fi
