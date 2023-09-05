autoload -U compinit 

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
