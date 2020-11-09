#!/bin/bash

if [ ! -d "/path/to/dir" ]; then
  echo 'Installing xxev'
  # Download xxenv and add plugin to pyenv
  git clone https://github.com/momo-lab/xxenv-latest.git "$(pyenv root)"/plugins/xxenv-latest
fi
# install the latest python version with pyenv
echo 'Installing latest python'
pyenv latest install
# set the latest python version globally with pyenv
echo 'Setting latest python to global'
pyenv latest global
# install virtual fish
echo 'Installing virtual fish'
python -m pip install virtualfish
# setup virtual fish
echo 'Setting up virtual fish'
vf install
