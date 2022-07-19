# Consider moving .zsh -> .zsh/zshrc and putting this file (among potential
# others) in .zsh/zshenv. Would need a .zshenv similar to .zshrc to source the
# files inside. For now this is fine.

# Prevent duplicates in PATH
typeset -U path PATH

path+=(~/.local/bin)
