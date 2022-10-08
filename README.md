# ABOUT

These dotfiles help me quickly configure a Linux machine to the way I like.
These dotfiles are meant to be used with a terminal view using a Powerline
patched font. Such a font can be found in .fonts.

# USAGE

1. Install zsh, tmux, and stow. Set the default shell to zsh.

```
sudo apt install zsh tmux stow tree
chsh -s $(which zsh)
```

2. Clone this repository to `~/.hstow/dotfiles`, and then stow it.

```
git clone git@github.com:shubhpatel18/dotfiles.git .hstow/dotfiles
stow -t ~ -d ~/.hstow dotfiles
```

3. Create a softlink to a startup script if desired (for example, to start
tmux automatically). Ensure the script prevents an infite loop from running.

```
ln -s <startup_script> .zsh/startup/startup.zsh
```

3. Ensure terminal uses a Powerline patched font. This will be host specific.

4. Restart terminal for changes to take effect.

## UPDATES

```
cd ~/.hstow/dotfiles
git pull
hstow
```

## THEMES

Supported themes: Campbell, Solarized Dark, Gruvbox Dark

Checkout THEMES.md for instructions on how to set up a new theme, or how to
install Gruvbox Dark.

1. Change themes in your terminal emulator. (Windows Terminal has Campbell and
Solarized Dark builtin)

2. Run the following command

```
set_theme <THEME_NAME>
```

## SSH AUTHENTICATION

Append the following lines to `~/.ssh/config` to use `ssh-agent` as I do.

```
Host *
	AddKeysToAgent yes
```

Also append the option `ForwardAgent yes` to any Host which the ssh-agent
should be forwarded to.

NOTE: Keys currently expire after 12 hours (see Line 12 in `~/.zsh/ssh_agent`).

WARNING: Sometimes multiple ssh sockets (`/tmp/ssh-...`) can exist for a single
ssh_agent. I'm not sure why this occurs. This can cause `$SSH_AUTH_SOCK` to be
bound improperly. If this happens use `keychain-reset` to restart `ssh-agent`
and rebind `$SSH_AUTH_SOCK`.

## IPYTHON

I like to use `ipython` on the command line. It can be installed via `pip`:

```
pip install ipython
```

Ensure its installation location is on `$PATH` then call it as:

```
ipython
```

Additional setup may be required to interactively show images/plots on a headless system. I prefer to access images on Windows for this reason.

## MARKDOWN

I like to use `pandoc` and `grip` for rendering markdown files. I use `grip`
to preview markdown files as I am editing them, and `pandoc` for rendering
finished PDFs.

### Grip

`grip` can be installed with the follwing command.

```
sudo apt install grip
```

To view a file preview with `grip`, execute `grip` as follows. `grip` will
then provide the address (`localhost:<port>`) to view within browser.

```
grip file.md
```

### Pandoc

Install `pandoc` (and required `LaTeX` dependecies) with the following
command.

```
sudo apt install pandoc texlive texlive-fonts-recommend texlive-fonts-extra
```

Render markdown files with `pandoc` as follows.

```
pandoc -s -o file.pdf file1.md... (file2.md) (file3.md)
```

or use the script I wrote in `~/.bin`

```
markdown file.md pdf
```

I always use the following YAML header in my markdown files if I am planning
to render with pandoc:

```
---
title: TITLE
author: Shubh Patel
geometry: margin=1in
---
```

## FURTHER CONFIGURATION

`zsh` startup files source modular scripts from the `.zsh` directory. Folders
correspond to the script executing them.

Additional system specific files can be created in the appropriate directory
to source on shell startup. Prefix with `-` to ignore from git.
