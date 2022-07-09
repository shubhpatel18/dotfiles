zshrc_dir=(${HOME}/.zsh/zshrc)
foreach cfg_file in ${zshrc_dir}/* ; do
	source "${cfg_file}"
done
unset zshrc_dir
