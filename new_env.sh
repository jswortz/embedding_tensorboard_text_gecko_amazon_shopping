#!/bin/bash
### This script enables custom conda environments on Vertex workbenches: 
###   - https://cloud.google.com/vertex-ai/docs/workbench/instances/add-environment
### Usage - . new_env.sh conda-env-name ipykernel-display-name

# Creates a conda environment.
conda create -n $1 -y
conda activate $1

# Install packages using a pip local to the conda environment.
conda install pip ipykernel -y
pip install -r requirements.txt

# Adds the conda kernel.
DL_ANACONDA_ENV_HOME="${DL_ANACONDA_HOME}/envs/$1"
python -m ipykernel install --prefix "${DL_ANACONDA_ENV_HOME}" --name $1 --display-name $2
