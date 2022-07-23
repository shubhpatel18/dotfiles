# ABOUT

These dotfiles help me quickly configure a Linux machine to the way I like.
These dotfiles are meant to be used with a terminal view using a Powerline
patched font. Such a font can be found in .fonts.

# USAGE

1. Install zsh, tmux, and stow. Set the default shell to zsh.

```
sudo apt install zsh tmux stow
chsh -s $(which zsh)
```

2. Clone this repository to `~/.hstow/dotfiles`, and then stow it.

```
git clone git@github.com:shubhpatel18/dotfiles.git .hstow/dotfiles
stow -t ~ -d ~/.hstow dotfiles
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

Supported themes: Campbell, Solarized Dark

Coming Soon (Hopefully): Solarized Light, Ubuntu, Gruvbox Light, Gruvbox Dark.

Checkout THEMES.md for instructions on how to set up a new theme.

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

## FURTHER CONFIGURATION

All files in `~/.zsh` are sourced for interactive shells.

Additional system specific files can be created in this directory to source on
shell startup. Prefix with '-' to ignore from git.
