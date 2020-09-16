#!/bin/bash

DIRECTORY=dotfiles

# Update to latest from github

cd ~
if [ -d "$DIRECTORY" ]; then
  cd "$DIRECTORY"
  git pull
else
  git clone git@github.com:ka3na/dotfiles.git "$DIRECTORY"
fi



echo '=== done ==='
