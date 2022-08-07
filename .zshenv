zshenv_dir=(${HOME}/.zsh/zshenv)
foreach cfg_file in ${zshenv_dir}/* ; do
	if [ -f "${cfg_file}" ] ; then
		source "${cfg_file}"
	fi
done
unset zshenv_dir
