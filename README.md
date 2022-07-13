# ABOUT

These dotfiles help me quickly configure a Linux machine to the way I like.

# USAGE

1. Clone this repository and move the contents to the home directory.

```
% git clone https://github.com/shubhpatel18/dotfiles.git
% rsync -a dotfiles/ ~/
% rm -rf dotfiles
```

2. Install and switch to zsh.

```
% sudo apt install zsh
% chsh -s $(which zsh)
```

## SSH AUTHENTICATION

Append the following lines to `~/.ssh/config` to use `ssh-agent` as I do.

```
Host *
	AddKeysToAgent yes
	ForwardAgent yes
```

NOTE: keys currently expire after 12 hours (see Line 12 in `~/.zsh/zprofile/ssh_agent`).

## IPYTHON

I like to use `ipython` on the command line. It can be installed via `pip`:

```
% pip install ipython
```

Ensure its installation location is on `$PATH` then call it as:

```
% ipython
```

Additional setup may be required to interactively show images/plots on a headless system. I prefer to access images on Windows for this reason.

## FURTHER CONFIGURATION

All files in `~/.zsh/zshrc` are sourced for interactive shells and all files in `~/.zsh/zprofile` are sourced for login shells.

Additional system specific files can be created in those directories to source on shell startup.
