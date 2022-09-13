startup_file=".zsh/startup/startup.zsh"
if [ -f $startup_file ] ; then
	source $startup_file
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
