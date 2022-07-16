setopt PROMPT_SUBST

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '  %b%u%c '

precmd() {
    # I should definitely be using this function to calculate the lengths
    # instead of doing so inside of the strings
    vcs_info
}

################################################################################

# working directory
WD='%B%F{015}%K{012} %$(($COLUMNS - $(eval echo $NON_WD_LEN)))<...<%~ %<<%F{012}%K{236}'

# git branch
GIT='%F{015}${vcs_info_msg_0_}%F{236}%K{234}'

# padding between left and right
PADDING='${(r:$COLUMNS - $(eval echo $FULL_LEN):: :)}'

# username
USR="%F{236}%F{015}%K{236} %n "

# hostname
HST="%K{236}%F{010}%F{016}%K{010} %m "

# actual prompt
PRMPT="
%b%f%k» "

################################################################################

# magic necessary for calculating length of prompt
ZERO="%([BSUbfksu]|([FK]|){*})"

# measure non working direction portion (offset 3 for spaces + angle in WD)
NON_WD="$GIT$USR$HST"
NON_WD_LEN='$(expr ${#${(S%%)NON_WD//$~ZERO/}}) - 3'

# measure full nonpadded top row
FULL="$WD$GIT$USR$HST"
FULL_LEN='${#${(S%%)FULL//$~ZERO/}}'

################################################################################

PROMPT_BUILDER='$WD'
PROMPT_BUILDER+='$GIT'
PROMPT_BUILDER+='$PADDING'
PROMPT_BUILDER+='$USR'
PROMPT_BUILDER+='$HST'
PROMPT_BUILDER+='$PRMPT'

PROMPT="$(eval echo $PROMPT_BUILDER)"

unset WD GIT PADDING USR HST PRMPT PROMPT_BUILDER

################################################################################

# Old prompt

#PROMPT='%f.-(%K{012}%~%f)${(r:$COLUMNS-7-$(expr length "$(dirs)")-$(expr \
#length ${"$(hostname)"%%.*})::-:)}%f(%F{010}%m%f)-
#\`-> %# '

################################################################################

# %n is the username of your account.
# %m is the machine.
# %d shows the full path to the working directory
# %~ shows the path to the working directory relative to ~
# %1~ means 1 directory deep
# %# means that the prompt will show # if the shell is running with root
#   (administrator) privileges, or else offers % if it doesn’t.

