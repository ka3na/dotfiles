#!/bin/bash

# ------------------------------------------------------------------------------
# Sync dotfiles from local or remote.
#
# REMOTE USAGE EXAMPLE:
# curl https://raw.githubusercontent.com/ka3na/dotfiles/master/admin/sync.sh | sh
# ------------------------------------------------------------------------------

# Defaults & parameters
DIR_ROOT="dotfiles"
DIR_BACKUP="dotfiles-backup/$(date +'%Y.%m.%d-%H.%M.%S')"

USER_FILES="bashrc bash_profile"

# Make sure we are in the user home directory
cd ~

# Sourcing required files
fileTextFormat=$DIR_ROOT/helpers/textFormat.sh
if [ -f "$fileTextFormat" ]; then
  source $fileTextFormat
else 
  tRed='\033[31m'
  tReset='\033[0m'
  echo $tRed"Error: file $fileTextFormat is required but does not exist"$tReset
  exit
fi

# Colours & styles
styleAction=$tBgGreen$tWhite
styleConfirm=$tGreen
styleInfo=$tWhite
styleWarning=$tYellow
styleError=$tRed
styleEnd=$tReset

# Update to latest from github
echo $styleAction" Pulling in latest updates... "$styleEnd
if [ -d "$DIR_ROOT" ]; then
  cd "$DIR_ROOT"
  git pull
  echo $styleConfirm"...done"$styleEnd
else
  echo $styleError"Error: $DIR_ROOT does not exist in home directory, please run the install script"$styleEnd
fi

# Loop over user files and symlink them to our dotfiles, backing up any content
for file in $USER_FILES; do
  dotfile=.$file
  echo $styleAction" Checking $dotfile... "$styleEnd

  if [ -L $dotfile ] ; then
    echo $styleInfo"File '$dotfile' exists, and is a symlink, deleting the symlink since we will be replacing it"$styleEnd
    rm $dotfile
  elif [ -e $dotfile ] ; then
    echo $styleInfo"File '$dotfile' exists but is not a symlink, backing up to $DIR_BACKUP"$styleEnd
    mkdir -p "$DIR_BACKUP"
    mv $dotfile $DIR_BACKUP/
  else
    echo $styleInfo"File '$dotfile' is missing, it's OK since we will be creating a new symlink here"$styleEnd
  fi

  # create a new symlink pointing to our dotfile
  echo $styleInfo"Creating symlink for '$dotfile' pointing to '$DIR_ROOT/user/$file'"$styleEnd
  ln -s $DIR_ROOT/user/$file $dotfile

  echo $styleConfirm"...done"$styleEnd

done
