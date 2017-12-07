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
cdpath=( ~ ~/Code ~/Desktop )
function chpwd() {
  emulate -L zsh
  ls -l
}

export EDITOR=vim

# Useful aliases
function gu() { gitup commit }
function hb() { hub browse }
function pr() { git push origin -u && hub pull-request $* }
function be() { bundle exec "$*"; }
function beg() { be guard "$*"; }
function bek() { be rake "$*"; }
function ber() { be rails "$*"; }
function berc() { ber c "$*"; }
function bers() { ber s "$*"; }

# Enable history in iex
export ERL_AFLAGS="-kernel shell_history enabled"
touch ~/.iex_history

if [[ -f "$HOME/.zshrc.private" ]]; then
  source "$HOME/.zshrc.private"
fi

if [[ -d "$HOME/.asdf" ]]; then
  source $HOME/.asdf/asdf.sh
  source $HOME/.asdf/completions/asdf.bash
fi
