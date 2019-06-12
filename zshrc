export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mtrudel"

DISABLE_AUTO_UPDATE="true"

unsetopt correct_all

ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

plugins=(git osx rails rake)

source $ZSH/oh-my-zsh.sh

setopt append_history no_inc_append_history no_share_history

path=($HOME/.bin $path)

# Make cd work better
cdpath=( ~ ~/Code ~/Desktop ~/Documents )
function chpwd() {
  emulate -L zsh
  ls -l
}

export EDITOR=vim

# Useful aliases
function serve() { open -a Google\ Chrome http://localhost:8000/ ;  ruby -run -e httpd . -p 8000 -b 127.0.0.1 }
function gu() { gitup commit }
function hb() { hub browse }
function pr() { git push origin -u && hub pull-request $* }
function be() { bundle exec "$*"; }
function beg() { be guard "$*"; }
function bek() { be rake "$*"; }
function ber() { be rails "$*"; }
function berc() { ber c "$*"; }
function bers() { ber s "$*"; }


if [[ -d "$HOME/.asdf" ]]; then
  source $HOME/.asdf/asdf.sh
  source $HOME/.asdf/completions/asdf.bash
fi

if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/*; do
    source $file
  done
fi

