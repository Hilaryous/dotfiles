#!/bin/bash set -x #echo on
# Check if Homebrew is installed
if [ ! -f "`which brew`" ]; then
  echo 'Installing homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ~/.zprofile
  eval "$(/usr/local/bin/brew shellenv)"
  # brew tap homebrew/bundle  # Install Homebrew Bundle
else
  echo 'Updating homebrew'
  brew update
fi

# TODO: figure how too skip is fish is already shell
# Change default shell to bash and setup fish
echo 'Changing default shell to fish, this will require a password'
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
