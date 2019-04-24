#!/bin/bash
# Automate process  of setting up an Ubuntu Virtual Machine environment


# Updating Ubuntu with packages from repositories
sudo apt update -y
sudo apt upgrade -y
# install precursors for dependencies
sudo apt-get install -qy build-essential curl file git
echo "Ubuntu updated"

# Install Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# Set path for Brew and add to Bash profile
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

echo "Installed brew"

brew install -y git
brew install -y azure-cli 
brew install -y node

echo "All done" 