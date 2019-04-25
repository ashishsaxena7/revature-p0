#!/bin/bash
#Automate process of setting up a new git repository structure, and create a web node-based project


# Verification of tools

if  [ -z $(which git) ]; then
    echo "Git not Installed, Please repeat Linux-Setup"
    exit 1
fi

if [ -z  $(which node) ]; then
    echo "Node not Installed, Please repeat Linux-Setup"
    exit 1
fi

# Define directory path
dirpath=$1


# if [ directory not empty && force flag false ]; then
if [ -n "$(ls -A $dirpath)" ]; then
echo "Directory already exists and is non-empty"
exit 1
fi 

cd $dirpath


# Create project structure
mkdir $dirpath/.docker

touch \
  .docker/dockerfile \
  .docker/dockerup.yaml

## github
mkdir -p \
  .github/ISSUE_TEMPLATE \
  .github/PULL_REQUEST_TEMPLATE

touch \
  .github/ISSUE_TEMPLATE/issue-template.md \
  .github/PULL_REQUEST_TEMPLATE/pull-request-template.md

touch \
  .github/CODE-OF-CONDUCT.md \
  .github/CONTRIBUTING.md

## root
mkdir \
  client \
  src \
  test

touch \
  client/.gitkeep \
  src/.gitkeep \
  test/.gitkeep

touch \
  .azureup.yaml \
  .dockerignore \
  .editorconfig \
  .gitignore \
  .markdownlint.yaml \
  CHANGELOG.md \
  LICENSE.txt \
README.md

# Convert to repository and node project
username=$2
useremail=$3

git init
git config user.name $username
git config user.email $useremail
npm init



# while getopts ":f:" opt; do
#   case $opt in
#     f)
#       makestructure()
#     \?)
#     echo "Directory already exists and is non-empty"
#     exit 1
#     esac
# elif
# makestructure()
# fi
