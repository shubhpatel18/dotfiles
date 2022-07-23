set -g status "on"
set -g status-justify "left"
set -g status-left-style "none"
set -g status-right-style "none"

set -g message-style "fg=colour15,bg=colour23"
set -g message-command-style "fg=colour15,bg=colour23"

set -g pane-border-style "fg=colour8"
set -g pane-active-border-style "fg=colour8 bg=colour23"

set -g status-style "none,bg=colour8"
set -g status-right-length "100"
set -g status-left-length "100"

set -g status-left ""
set -g status-right "#[fg=colour30,bg=colour8]#[fg=colour15,bg=colour30] #h "

setw -g window-status-format "#[fg=colour8,bg=colour23]#[fg=colour15,bg=colour23] #I:#W #[fg=colour23,bg=colour8]"
setw -g window-status-current-format "#[fg=colour8,bg=colour30]#[fg=colour15,bg=colour30] #I:#W #[fg=colour30,bg=colour8]"
