alias h='history'
alias hg='history 0 | grep'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd..='cd ..'

alias ls='ls -F'
alias la='ls -A'
alias ll='ls -Al'
alias lh='ls -d .*'
alias llh='ls -dl .*'

if [ -x /usr/bin/dircolors ] ; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls -F --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

cdl() { cd "$@"; ls; }
cdla() { cd "$@"; la; }
cdll() { cd "$@"; ll; }
cdlh() { cd "$@"; lh; }
cdllh() { cd "$@"; llh; }

