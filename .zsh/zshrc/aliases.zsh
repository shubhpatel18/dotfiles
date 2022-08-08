### HISTORY ##################################################################

alias h='history'
alias hg='history 0 | grep'

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

### SHOW FILES ###############################################################

alias tree='tree -F'

t() {
	if [ $# = 0 ] ; then
		tree -aL 1
	elif [ $# = 1 ] ; then
		tree -aL $1
	else
		echo "USAGE: t <depth, default=1>"
		return 1
	fi
}

alias ls='ls -F'
alias la='ls -A'
alias ll='ls -Al'
alias lh='ls -d .*'
alias llh='ls -dl .*'

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

##############################################################################
