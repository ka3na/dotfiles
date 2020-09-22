#!/bin/bash

fileTextFormat=helpers/textFormat.sh
if [ -f "$fileTextFormat" ]; then
  source $fileTextFormat
else 
  echo "$fileTextFormat does not exist."
fi

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

styleAction=$tBgGreen$tWhite
styleConfirm=$tGreen
styleInfo=$tWhite
styleWarning=$tYellow
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
  # echo $styleAction" Cloning into '$DIR_ROOT' folder ... "$styleEnd
  # git clone git@github.com:ka3na/dotfiles.git "$DIR_ROOT"
  # echo $styleConfirm"...done"$styleEnd
fi

# Loop over user files and symlink them to our dotfiles, backing up any content
cd ~
for file in $USER_FILES; do
  dotfile=.$file
  echo $styleAction" Checking $dotfile... "$styleEnd

  if [ -L $dotfile ] ; then
    echo $styleInfo"-> File '$dotfile' exists, and is a symlink, deleting the symlink since we will be replacing it"$styleEnd
    rm $dotfile
  elif [ -e $dotfile ] ; then
    echo $styleInfo"-> File '$dotfile' exists but is not a symlink, backing up to $DIR_BACKUP"$styleEnd
    mkdir -p "$DIR_BACKUP"
    mv $dotfile $DIR_BACKUP/
  else
    echo $styleInfo"-> File '$dotfile' is missing, it's OK since we will be creating a new symlink here"$styleEnd
  fi

  # create a new symlink pointing to our dotfile
  echo $styleInfo"-> Creating symlink for '$dotfile' pointing to '$DIR_ROOT/user/$file'"$styleEnd
  ln -s $DIR_ROOT/user/$file $dotfile

  echo $styleConfirm"...done"$styleEnd

done
