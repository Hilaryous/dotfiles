#!/bin/bash set -x #echo on
# Check if Homebrew is installed
if [ ! -f "`which brew`" ]; then
  echo 'Installing homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'Run post install'
  eval "$(opt/homebrew/bin/brew shellenv)"
  (echo; echo 'eval "$(opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
  # brew tap homebrew/bundle  # Install Homebrew Bundle
else
  echo 'Updating homebrew'
  brew update
fi

# Change default shell to bash and setup fish
if [ "$SHELL" != "/opt/homebrew/bin/fish" ]; then
  echo 'Changing default shell to fish, this will require a password'
  echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
  chsh -s /opt/homebrew/bin/fish
else
  echo "Your shell is already set to fish (/opt/homebrew/bin/fish), skipping switching shell to fish"
fi
