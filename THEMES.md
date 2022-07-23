# ABOUT

This document describes how to create new themes for this dotfile configuration.

# PROCEDURE

1. Create new themes for Airline, Vim, Tmux Statusline, Zsh Prompt. It is
recommend to duplicate an existing theme and change color codes as needed.

	1. Add a new theme to `~/.vim/airline_themes/`.

	2. Add a new theme to `~/.vim/colors/`.

	3. Add a new theme to `~/.tmux`.

	4. Add a new theme to `~/.zsh/prompts/`.

2. Modify `~/.zsh/themes.zsh`.

	1. Add a new branch to the if statement in the `themes` function. Include the
name of the airline theme and vim theme, and the paths to the tmuxline theme and
prompt zsh script.

	2. Update the `set_theme` function to accept the new theme name.
