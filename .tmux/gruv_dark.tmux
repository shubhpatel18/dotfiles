set -g status "on"
set -g status-justify "left"
set -g status-left-style "none"
set -g status-right-style "none"

set -g message-style "fg=colour0,bg=colour7"
set -g message-command-style "fg=colour0,bg=colour7"

set -g pane-border-style "fg=colour237"
set -g pane-active-border-style "fg=colour237 bg=colour7"

set -g status-style "none,bg=colour237"
set -g status-right-length "100"
set -g status-left-length "100"

set -g status-left ""
set -g status-right "#[fg=colour15,bg=colour237]#[fg=colour0,bg=colour15] #h "

setw -g window-status-format "#[fg=colour237,bg=colour7]#[fg=colour0,bg=colour7] #I:#W #[fg=colour7,bg=colour237]"
setw -g window-status-current-format "#[fg=colour237,bg=colour15]#[fg=colour0,bg=colour15] #I:#W #[fg=colour15,bg=colour237]"
