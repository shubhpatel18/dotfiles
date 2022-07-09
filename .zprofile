zprofile_dir=(${HOME}/.zsh/zprofile)
foreach cfg_file in ${zprofile_dir}/* ; do
	source "${cfg_file}"
done
unset zprofile_dir
