# dotfiles

## Summary

- This config is using BASH over ZSH, personal preference
- For anything that requires to be unversioned, using `~/.bashrc_local` which is pulled in by `~/.bashrc`

## Installation & Sync

Install dotfiles in the home directory, if `.dotfiles` exists then this will back up the folder and install this repo from fresh
`curl https://raw.githubusercontent.com/ka3na/dotfiles/master/admin/install.sh | sh`

Update repo to the latest version and sync dotfiles, once installed
`curl https://raw.githubusercontent.com/ka3na/dotfiles/master/admin/sync.sh | sh`

## Structure

- **admin** - contains install and sync scripts for this repo
- **helpers** - helper functions for styling, testing, debugging
- **runcom** - various useful run commands
  - **nvmrc** - changes node version based on .nvmrc file when traversing through directories
  - **utilities** - various useful functions
- **shell-bash** - bash specific configuration
  - **aliases** - bash alases
  - **prompt** - custom terminal prompt
  - **settings** - bash settings
- **system-linux** - linux specific configuration
- **system-macos** - mac os specific configuration
- **todo** - todo's i've not had time to add, but on the list
- **user** - user profile configuration

## To Do

- Add history search arrow up and down based on typed prefix

## References

Inspired by these great examples:
- https://github.com/cowboy/dotfiles
- https://github.com/holman/dotfiles
- https://github.com/jogendra/dotfiles
- https://github.com/mathiasbynens/dotfiles
- https://github.com/necolas/dotfiles
- https://github.com/nikiforovall/dotfiles
- https://github.com/paulirish/dotfiles
