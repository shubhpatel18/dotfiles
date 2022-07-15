setopt PROMPT_SUBST
autoload -U colors && colors
PROMPT='%f.-(%F{012}%~%f)${(r:$COLUMNS-7-$(expr length "$(dirs)")-$(expr \
length ${"$(hostname)"%%.*})::-:)}%f(%F{010}%m%f)-
\`-> %# '

# %n is the username of your account.
# %m is the machine.
# %d shows the full path to the working directory
# %~ shows the path to the working directory relative to ~
# %1~ means 1 directory deep
# %# means that the prompt will show # if the shell is running with root
#   (administrator) privileges, or else offers % if it doesn’t.
