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

# SUPPORTED THEMES

Currently Campbell, Solarized Dark, and Gruvbox Dark are supported.

Campbell and Solarized Dark are typically easily accessible though Gruvbox
Dark may need to be installed.

## Installing Gruvbox Dark on Windows Terminal

Add the following to `settings.json`:

```
{
  "background" : "#282828",
  "black" : "#282828",
  "blue" : "#458588",
  "brightBlack" : "#928374",
  "brightBlue" : "#83A598",
  "brightCyan" : "#8EC07C",
  "brightGreen" : "#B8BB26",
  "brightPurple" : "#D3869B",
  "brightRed" : "#FB4934",
  "brightWhite" : "#EBDBB2",
  "brightYellow" : "#FABD2F",
  "cyan" : "#689D6A",
  "foreground" : "#EBDBB2",
  "green" : "#98971A",
  "name" : "Gruvbox Dark",
  "purple" : "#B16286",
  "red" : "#CC241D",
  "white" : "#A89984",
  "yellow" : "#D79921"
}
```
