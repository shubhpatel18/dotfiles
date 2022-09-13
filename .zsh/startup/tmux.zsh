if [ -t 0 ] && [[ -z "$TMUX" ]] && [[ $- = *i* ]]; then
	exec tmux new -As "$USER";
fi
