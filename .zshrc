if [ -t 0 ] && [[ -z "$TMUX" ]] && [[ $- = *i* ]] ; then
	exec tmux new -As "$USER";
fi

zshrc_dir=(${HOME}/.zsh/zshrc)
foreach cfg_file in ${zshrc_dir}/* ; do
	if [ -f "${cfg_file}" ] ; then
		source "${cfg_file}"
	fi
done
unset zshrc_dir

plugins_dir=(${HOME}/.zsh/plugins)
source $plugins_dir/zsh-history-substring-search.zsh
source $plugins_dir/zsh-syntax-highlighting.zsh
unset plugins_dir
