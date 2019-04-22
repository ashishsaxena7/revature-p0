#!/bin/bash

# Verification

if ![ git ]; then
    echo "Git not Installed, Please repeat Linux-Setup"
    exit 1
fi

if ![ az ]; then
    "echo Azure not Installed, Please repeat Linux-Setup"
    exit 1
fi

if ![ node ]; then
    "echo Node not Installed, Please repeat Linux-Setup"
    exit 1
fi

# Create project structure

git init
npm init -y

mkdir .docker

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

# Push to github

# git init
# cd ~/revature/scripts
# git add 
# git commit

