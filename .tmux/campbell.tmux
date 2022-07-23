set -g status "on"
set -g status-justify "left"
set -g status-left-style "none"
set -g status-right-style "none"

set -g message-style "fg=colour15,bg=colour238"
set -g message-command-style "fg=colour15,bg=colour238"

set -g pane-border-style "fg=colour234"
set -g pane-active-border-style "fg=colour234 bg=colour238"

set -g status-style "none,bg=colour234"
set -g status-right-length "100"
set -g status-left-length "100"

set -g status-left ""
set -g status-right "#[fg=colour238,bg=colour234]#[fg=colour15,bg=colour238] #h "

setw -g window-status-format "#[fg=colour234,bg=colour236]#[fg=colour15,bg=colour236] #I:#W #[fg=colour236,bg=colour234]"
setw -g window-status-current-format "#[fg=colour234,bg=colour238]#[fg=colour15,bg=colour238] #I:#W #[fg=colour238,bg=colour234]"
