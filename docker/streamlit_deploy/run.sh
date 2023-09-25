#!/bin/bash

git -c http.sslVerify=false clone $GITHUB .

pip3 install -r requirements.txt --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org

streamlit run $ENTRY --server.port=8501 --server.address=0.0.0.0