zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

setopt hist_ignore_all_dups
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd extendedglob nomatch
unsetopt beep notify
