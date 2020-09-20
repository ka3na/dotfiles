#!/bin/bash

source helpers/textFormat.sh

# ------------------------------------------------------------------------------
# Sync dotfiles from local or remote.
#
# LOCAL USAGE EXAMPLE:
# sh ~/Development/ka3na/dotfiles/sync.sh
#
# REMOTE USAGE EXAMPLE:
# curl https://raw.githubusercontent.com/ka3na/dotfiles/master/sync.sh | sh
# ------------------------------------------------------------------------------

# DEFAULTS & PARAMETERS
DIR_ROOT="dotfiles"
DIR_BACKUP="dotfiles-backup/$(date +'%Y.%m.%d-%H.%M.%S')"

USER_FILES="bashrc bash_profile"

styleAction=$tBgGreen$tWhite
styleConfirm=$tGreen
styleWarning=$tYellow
styleInfo=$tDefault
styleError=$tRed
styleEnd=$tReset

# Update to latest from github
cd ~
if [ -d "$DIR_ROOT" ]; then
  echo $styleAction" Pulling latest into ~/$DIR_ROOT folder... "$styleEnd
  cd "$DIR_ROOT"
  git pull
  echo $styleConfirm"...done"$styleEnd
else
  echo $styleAction" Cloning into '$DIR_ROOT' folder ... "$styleEnd
  git clone git@github.com:ka3na/dotfiles.git "$DIR_ROOT"
  echo $styleConfirm"...done"$styleEnd
fi

# Loop over user files and symlink them to our dotfiles, backing up any content
cd ~
for file in $USER_FILES; do
  dotfile=.$file
  echo $styleAction" Checking $dotfile... "$styleEnd

  if [ -L $dotfile ] ; then
    echo $styleInfo"$dotfile exists and is a symlink, deleting the symlink since we will be replacing it"$styleEnd
    rm $dotfile
    echo $styleConfirm"...done"$styleEnd
  elif [ -e $dotfile ] ; then
    echo $styleInfo"$dotfile exists but is not a symlink, backing up to $DIR_BACKUP"$styleEnd
    mkdir -p "$DIR_BACKUP"
    mv $dotfile $DIR_BACKUP/
    echo $styleConfirm"...done"$styleEnd
  else
    echo $styleInfo"$dotfile is missing, it's OK since we will be creating a new symlink here"$styleEnd
    echo $styleConfirm"...done"$styleEnd
  fi

  # create a new symlink pointing to our dotfile
  ln -s $DIR_ROOT/user/$file $dotfile
done
