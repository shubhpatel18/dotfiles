zshrc_dir=(${HOME}/.zsh)
foreach cfg_file in ${zshrc_dir}/* ; do
	if [ -f "${cfg_file}" ] ; then
		source "${cfg_file}"
	fi
done
unset zshrc_diri

if [ -t 0 ] && [[ -z "$TMUX" ]] && [[ $- = *i* ]] ; then
	exec tmux new -As "$USER";
fi

