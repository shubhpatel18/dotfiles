theme() {

	local theme
	theme=$(cat ~/.theme 2>/dev/null)

	if [ $? = 1 ] || [ $theme = "CAMPBELL" ]; then

		export VIM_AIRLINE_THEME="dark"
		export VIM_COLOR_THEME="shubh_dark"
		[ -n "$TMUX" ] && tmux source-file ~/.tmux/campbell.tmux
		source ~/.zsh/prompts/campbell.zsh

	elif [ $theme = "GRUVBOX_DARK" ] ; then

		export VIM_AIRLINE_THEME="gruv_dark"
		export VIM_COLOR_THEME="shubh_gruv_dark"
		[ -n "$TMUX" ] && tmux source-file ~/.tmux/gruv_dark.tmux
		source ~/.zsh/prompts/gruv_dark.zsh

	elif [ $theme = "SOLARIZED_DARK" ] ; then

		export VIM_AIRLINE_THEME="solarized_dark"
		export VIM_COLOR_THEME="shubh_sol_dark"
		[ -n "$TMUX" ] && tmux source-file ~/.tmux/sol_dark.tmux
		source ~/.zsh/prompts/sol_dark.zsh

	elif [ $theme = "SOLARIZED_LIGHT" ] ; then

		export VIM_AIRLINE_THEME="solarized_light"
		export VIM_COLOR_THEME="shubh_sol_light"
		[ -n "$TMUX" ] && tmux source-file ~/.tmux/sol_light.tmux
		source ~/.zsh/prompts/sol_light.zsh

	else

		echo "Invalid Theme"
		return 1

	fi
}

theme

set_theme() {
	if [ $# != 1 ] || [ $1 != "CAMPBELL" ] && [ $1 != "SOLARIZED_DARK" ] \
		&& [ $1 != "GRUVBOX_DARK" ] && [ $1 != "SOLARIZED_LIGHT" ] ; then
		echo "USAGE: $0 <CAMPBELL|SOLARIZED_DARK|SOLARIZED_LIGHT|GRUVBOX_DARK>"
		return 1
	else
		echo "Run 'theme' in any other open windows to update the theme"
		echo "$1" > ~/.theme
		theme
	fi
}
