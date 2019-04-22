#!/bin/bash

# Set up a Virtual Machine environment

# sudo
apt update -qy
# sudo 
apt upgrade -qy
#sudo
apt-get install -qy build-essential curl file git

echo "Ubuntu updated"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

echo "Installed brew"

brew install -q git
brew install -q gcc
brew install -q azure-cli 
brew install -q node

echo "All done" 