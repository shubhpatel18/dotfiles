zshrc_dir=(${HOME}/.zsh/zshrc)
foreach cfg_file in ${zshrc_dir}/* ; do
	if [ -f "${cfg_file}" ] ; then
		source "${cfg_file}"
  	fi
done
unset zshrc_dir
