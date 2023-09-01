autoload -U colors && colors 

autoload -Uz vcs_info
precmd() { vcs_info }

# The following sets %m based on whether the tree is in any way dirty
+vi-git-untracked() {
  if [[ -n $(git status --porcelain) ]]; then hook_com[misc]='%F{green}!%f' fi
}
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' (%F{magenta}%b%f%m)'
 
setopt PROMPT_SUBST
PROMPT='%(?.%F{green}✓%f.%F{red}×%f)%(1j. %F{cyan}%j%f .)[%F{blue}%n@%m%f %B%~%b]${vcs_info_msg_0_}%(!.#.$) '
