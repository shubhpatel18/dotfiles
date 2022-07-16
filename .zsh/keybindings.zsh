# Ctrl+Backspace to delete word before cursor
bindkey '^H' backward-kill-word

# Ctrl+Delete to delete word after cursor
bindkey '5~' kill-word

# Ctrl+Right/Left arrow to jump forward/backward
bindkey ';5C' forward-word
bindkey ';5D' backward-word

# Ctrl+l to clear console
bindkey '' clear-screen

# History search with Up/Down arrow on command line
autoload -U history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey '^[OA' history-beginning-search-backward-end
# bindkey '^[OB' history-beginning-search-forward-end
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down