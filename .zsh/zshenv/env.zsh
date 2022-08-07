# Prevent duplicates in PATH
typeset -U path PATH

path+=(~/.local/bin)
path+=(~/.bin)
