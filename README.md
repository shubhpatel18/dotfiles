# ABOUT

These dotfiles help me quickly configure a Linux machine to the way I like

# USAGE

1. Clone this repository and move the contents to the home directory

```
% git clone https://github.com/shubhpatel18/dotfiles.git
% rsync dotfiles/ ~/
% rm -rf dotfiles
```

2. Install and switch to zsh

```
% sudo apt install zsh
% chsh -s $(which zsh)
```

## SSH AUTHENTICATION

Add the following lines to .ssh/config to use the ssh-agent

Note that keys currently expire after 12 hours (see Line 5 in .zsh/zprofile/ssh_agent)

```
Host *
	AddKeysToAgent yes
	ForwardAgent yes
```

