#!/bin/bash

# install pyenv
if [ ! -f "`which brew`" ]; then
  brew install pyenv
fi
# install the latest python version with pyenv
echo 'Installing latest python'
pyenv install 3.12.2
# set the latest python version globally with pyenv
echo 'Setting latest python to global'
pyenv global 3.12.2
# install virtual fish
echo 'Installing virtual fish'
python -m pip install --quiet virtualfish
# install python setuptools
echo 'Installing python setup tools'
python -m pip install --quiet setuptools
# setup virtual fish
echo 'Setting up virtual fish'
vf install
