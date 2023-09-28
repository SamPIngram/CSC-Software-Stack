#!/bin/bash

if ([ -z "${DIR}" ] && [ -z "${REPO}" ]); then
    echo "No DIR or REPO given"
elif [ -z "${DIR}" ]; then
    echo "No directory given, attempting to use GitHub Repo."
    rm -r /app
    mkdir /app
    cd /app
    git -c http.sslVerify=false clone $REPO .
    /miniconda/bin/conda config --set ssl_verify False
    /miniconda/bin/conda update -y conda
    /miniconda/bin/conda init
    source ~/.bashrc
    if [ -f "environment.yml" ]; then
        conda install -c conda-forge mamba -y
        mamba env create -f environment.yml --prefix ~/.conda/envs/developer --force 
        ~/.conda/envs/developer/bin/python streamlit run $ENTRY --server.port=8501 --server.address=0.0.0.0
    elif [ -f "requirements.txt" ]; then
        /miniconda/bin/python -m pip install -r requirements.txt --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org
        /miniconda/bin/python -m streamlit run $ENTRY --server.port=8501 --server.address=0.0.0.0
    fi
elif [ -z "${REPO}" ]; then
    echo "No Github given, attempting to use directory."
    cd $DIR
    /miniconda/bin/conda config --set ssl_verify False
    /miniconda/bin/conda update -y conda
    /miniconda/bin/conda init
    source ~/.bashrc
    if [ -f "environment.yml" ]; then
        conda install -c conda-forge mamba -y
        mamba env create -f environment.yml --prefix ~/.conda/envs/developer --force 
        ~/.conda/envs/developer/bin/python streamlit run $ENTRY --server.port=8501 --server.address=0.0.0.0
    elif [ -f "requirements.txt" ]; then
        /miniconda/bin/python -m pip install -r requirements.txt --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org
        /miniconda/bin/python -m streamlit run $ENTRY --server.port=8501 --server.address=0.0.0.0
    fi
else
    echo "You've given both a DIR and REPO. One should be left blank!"
fi
