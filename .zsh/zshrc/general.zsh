# configure autocompletions
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# configure history files
setopt hist_ignore_all_dups
setopt share_history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# misc
setopt autocd extendedglob nomatch
unsetopt beep notify
