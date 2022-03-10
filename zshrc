ZSHRC=$HOME/.zshrc
export DOTFILE_PATH=$(dirname ${ZSHRC:A})

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mtrudel"

DISABLE_AUTO_UPDATE="true"

unsetopt correct_all

ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

plugins=(git macos rails rake)

source $ZSH/oh-my-zsh.sh

setopt append_history no_inc_append_history no_share_history

path=($HOME/.bin $path)

# Make cd work better
cdpath=( ~ ~/Code ~/Desktop ~/Documents )
function chpwd() {
  emulate -L zsh
  ls -l
}

alias dotfile='cd $DOTFILE_PATH'

if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/*; do
    source $file
  done
fi
