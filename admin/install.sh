#!/bin/bash

# ------------------------------------------------------------------------------
# Install the dotfiles repository.
#
# This acts as a reset as it will back up and replace any existing 'dotfiles' 
# folder that already exists in the user's home directory.
#
# USAGE:
# curl https://raw.githubusercontent.com/ka3na/dotfiles/master/admin/install.sh | sh
# ------------------------------------------------------------------------------

# Defaults & parameters
DIR_ROOT="dotfiles"
DIR_BACKUP="dotfiles-backup/$(date +'%Y.%m.%d-%H.%M.%S')"

# Colours & styles
tWhite='\033[97m'
tRed='\033[31m'
tGreen='\033[32m'
tYellow='\033[33m'
tBgGreen='\033[42m'
tReset='\033[0m'

styleAction=$tBgGreen$tWhite
styleConfirm=$tGreen
styleInfo=$tWhite
styleWarning=$tYellow
styleError=$tRed
styleEnd=$tReset

# Check if our installation path is available
cd ~
echo $styleAction" Checking if required path '$DIR_ROOT' is available "$styleEnd
if [ -e "$DIR_ROOT" ]; then
  if [ -d "$DIR_ROOT" ]; then
    echo $styleWarning"Required '$DIR_ROOT' path already exists and is a folder"$styleEnd
  else
    echo $styleWarning"Required '$DIR_ROOT' path already exists and is a file"$styleEnd
  fi
  echo $styleInfo"Backing up into '$DIR_BACKUP'"$styleEnd
  mkdir -p "$DIR_BACKUP"
  mv $DIR_ROOT $DIR_BACKUP/
else
  echo $styleInfo"Required '$DIR_ROOT' path is clear"$styleEnd
fi
echo $styleConfirm"...done"$styleEnd

# Clone the 'dotfiles' repo into the user home directory
echo $styleAction" Cloning the 'ka3na/dotfiles' repository into '$DIR_ROOT' folder "$styleEnd
git clone git@github.com:ka3na/dotfiles.git "$DIR_ROOT"
echo $styleConfirm"...done"$styleEnd

# Call the sync command
echo $styleAction" Calling the sync command "$styleEnd
fileSync=dotfiles/admin/sync.sh
if [ -f "$fileSync" ]; then
  echo $styleConfirm"...sync file found"$styleEnd
  source $fileSync
else 
  echo $styleError"Unable to complete the action, $fileSync does not exist"$styleEnd
fi
