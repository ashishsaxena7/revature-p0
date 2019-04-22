#!/bin/bash

# Set up a Virtual Machine environment

sudo apt update -y
sudo apt upgrade -y
sudo apt-get install build-essential curl file git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

brew install git
brew install -y azure-cli 
brew install -y node

echo "All done" 