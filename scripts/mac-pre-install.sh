#!/bin/bash set -x #echo on

# Detect Homebrew prefix based on chip architecture
if [ "$(uname -m)" = "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
else
  BREW_PREFIX="/usr/local"
fi

BREW_BIN="$BREW_PREFIX/bin/brew"
FISH_BIN="$BREW_PREFIX/bin/fish"

# Check if Homebrew is installed
if [ ! -f "`which brew`" ]; then
  echo 'Installing homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'Run post install'
  eval "$($BREW_BIN shellenv)"
  (echo; echo "eval \"\$($BREW_BIN shellenv)\"") >> ~/.zprofile
  # brew tap homebrew/bundle  # Install Homebrew Bundle
else
  echo 'Updating homebrew'
  brew update
fi

# Change default shell to fish
if [ "$SHELL" != "$FISH_BIN" ]; then
  echo 'Changing default shell to fish, this will require a password'
  echo "$FISH_BIN" | sudo tee -a /etc/shells
  chsh -s "$FISH_BIN"
else
  echo "Shell already set to fish, skipping."
fi
