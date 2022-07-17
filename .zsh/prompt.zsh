setopt PROMPT_SUBST

autoload -U colors && colors

git_info() {

	# Exit if not inside a Git repository
	! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

	# Git branch/tag, or name-rev if on detached head
	local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

	local AHEAD="%F{009}↑NUM"
	local BEHIND="%F{010}↓NUM"
	local MERGING="%F{012}⚡︎"
	local UNTRACKED="%F{009}●"
	local MODIFIED="%F{011}●"
	local STAGED="%F{010}●"

	local -a DIVERGENCES
	local -a FLAGS

	local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
	if [ "$NUM_AHEAD" -gt 0 ]; then
		DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
	fi

	local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
	if [ "$NUM_BEHIND" -gt 0 ]; then
		DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
	fi

	local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
	if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
		FLAGS+=( "$MERGING" )
	fi

	# check git diff's return code to see if it makes sense to determine flags
	# false outside of Git repo or inside .git, true otherwise
	if git diff > /dev/null 2>&1; then
		if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
		FLAGS+=( "$UNTRACKED" )
		fi

		if ! git diff --quiet 2> /dev/null; then
			FLAGS+=( "$MODIFIED" )
		fi

		if ! git diff --cached --quiet 2> /dev/null; then
			FLAGS+=( "$STAGED" )
		fi
	fi

	local -a GIT_INFO
	GIT_INFO+=( "$GIT_LOCATION" )
	[[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
	[[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
	[[ ${#GIT_INFO[@]} -ne 0 ]] && echo "  ${(j: :)GIT_INFO} "

}

prompt() {

	# colors
	local wdfg="015"
	local wdbg="012"
	local gitfg="015"
	local gitbg="238"
	local padbg="234"
	local timefg="015"
	local timebg="238"
	local hstfg="016"
	local hstbg="010"
	local prmfg="015"

	# Non adaptive prompt elements
	local GIT="%F{$gitfg}%K{$gitbg}$(git_info)%F{$gitbg}%K{$padbg}"
	local TIME="%F{$timebg}%K{$padbg}%F{$timefg}%K{$timebg} %t "
	local HST="%F{$hstbg}%K{$timebg}%F{$hstfg}%K{$hstbg} %m "
	local PRMPT="\n%F{$prmfg}%k» %f%k"

	# Adaptive prompt elements
	local WD_TEMPLATE="%F{$wdfg}%K{$wdbg} %COLS<...<%~ %<<%F{$wdbg}%K{$gitbg}"
	local PADDING_TEMPLATE="%K{$padbg}SPACES"

	# Magic necessary for calculating length of prompt sections
	local ZERO="%([BSUbfksu]|([FK]|){*})"

	# working directory
	local NON_WD="$GIT$TIME$HST"
	local NON_WD_LEN=${#${(S%%)NON_WD//$~ZERO/}}
	local WD_LEN=$(( $COLUMNS - $NON_WD_LEN - 3 )) # 3 = 2 spaces + 1 > in WD
	local WD=( "${WD_TEMPLATE//COLS/$WD_LEN}" )

	# padding between left and right
	local FULL="$WD$GIT$TIME$HST"
	local FULL_LEN=${#${(S%%)FULL//$~ZERO/}}
	local SPACES=${(r:$COLUMNS - $(eval echo $FULL_LEN):: :)}
	local PADDING=( "${PADDING_TEMPLATE//SPACES/$SPACES}" )

	local -a PROMPT_BUILDER
	PROMPT_BUILDER="$WD"
	PROMPT_BUILDER+="$GIT"
	PROMPT_BUILDER+="$PADDING"
	PROMPT_BUILDER+="$TIME"
	PROMPT_BUILDER+="$HST"
	PROMPT_BUILDER+="$PRMPT"
	echo $PROMPT_BUILDER

}

PROMPT='$(prompt)'

################################################################################

# Old prompt

#PROMPT='%f.-(%K{012}%~%f)${(r:$COLUMNS-7-$(expr length "$(dirs)")-$(expr \
#length ${"$(hostname)"%%.*})::-:)}%f(%F{010}%m%f)-
#\`-> %# '

################################################################################

# %n is the username of your account.
# %m is the machine.
# %t shows the time in 12 hour format.
# %* shows the time in 24 hour format.
# %d shows the full path to the working directory
# %~ shows the path to the working directory relative to ~
# %1~ means 1 directory deep
# %# means that the prompt will show # if the shell is running with root
#   (administrator) privileges, or else offers % if it doesn’t.
