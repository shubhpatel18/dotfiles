### HISTORY ##################################################################

alias h='history'
alias hg='history 0 | grep'

### SHOW FILES ###############################################################

alias tree='tree -F --noreport'
alias t='tree -L 1'
alias tt='tree -a -L 1'
alias th='tree -a -P ".*" --matchdirs --prune -L 1'

alias ls='ls -F'
alias la='ls -A'
alias ll='ls -Al'
alias lh='ls -d .*'
alias llh='ls -dl .*'

#### CHANGE DIRECTORY ########################################################

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd..='cd ..'

cdl() { cd "$@"; ls; }
cdla() { cd "$@"; la; }
cdll() { cd "$@"; ll; }
cdlh() { cd "$@"; lh; }
cdllh() { cd "$@"; llh; }

### AUTOCOLOR ################################################################

if [ -x /usr/bin/dircolors ] ; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls -F --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

### TMUX SHORTCUTS ###########################################################

alias ttc='tmux choose-window'

ttw() {
	if [ $# -eq 0 ] ; then
		tmux new-window
	else
		tmux select-window -t $1
	fi
}
alias ttnw='tmux next-window'
alias ttpw='tmux previous-window'

ttp() {
	if [ $# -eq 0 ] ; then
		echo "current pane: $(tmux display-message -p '#P')"
	else
		tmux select-pane -t $1
	fi
}
alias tth='tmux splitw -h'
alias ttv='tmux splitw -v'

### GIT SHORTCUTS ############################################################

hash="%C(yellow)%h"
base="%x09%Cblue%<(14)%ad %Cgreen%<(15)%an %Cred%d %Creset%s"

alias glg="git log --graph --date=relative"
alias glog="glg --pretty=format:'$base'"
alias glogs="glg --pretty=format:'$base' -n 10"
alias glogh="glg --pretty=format:'$hash $base'"
alias gloghs="glg --pretty=format:'$hash $base' -n 10"

unset hash
unset base

##############################################################################
