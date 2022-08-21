#!/bin/bash
set -eu
cd $(dirname $0)

option=$*

if [ "$option" = "--reset" ]; then
    echo "*** reset all dependencies of conda ***"
    conda env create -f environment.yml --force
else
    echo "WARNING: To remove unused dependencies, please use '--reset' option (may take a long time since it reinstalls all pip dependencies)"
    # --prune means 'remove unused packages installed by `conda install` command'
    # ref. https://github.com/conda/conda/issues/7279#issuecomment-516438069
    echo "*** update dependencies of conda ***"
    conda env update -f environment.yml --prune
fi
