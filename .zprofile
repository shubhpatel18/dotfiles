zprofile_dir=(${HOME}/.zsh/zprofile)
foreach cfg_file in ${zprofile_dir}/* ; do
	if [ -f "${cfg_file}" ] ; then
		source "${cfg_file}"
  	fi
done
unset zprofile_dir
