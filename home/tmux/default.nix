{ ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g prefix C-space
      unbind-key C-b
      bind-key C-space send-prefix

      set -sg escape-time 0

      is_vim="ps -o state= -o comm= -t "#{pane_tty}" \
          | grep -iqE "^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$""
      bind-key -n "C-h" if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
      bind-key -n "C-j" if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
      bind-key -n "C-k" if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
      bind-key -n "C-l" if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
      tmux_version="$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")"
      if-shell -b "[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]" \
          "bind-key -n "C-\\" if-shell \"$is_vim\" "send-keys C-\\"  "select-pane -l""
      if-shell -b "[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]" \
          "bind-key -n "C-\\" if-shell \"$is_vim\" "send-keys C-\\\\"  "select-pane -l""


      # Set new panes to open in current directory
      bind c new-window -c "#{pane_current_path}"
      bind v split-window -c "#{pane_current_path}"
      bind h split-window -h -c "#{pane_current_path}"

      bind-key -T copy-mode-vi "C-h" select-pane -L
      bind-key -T copy-mode-vi "C-j" select-pane -D
      bind-key -T copy-mode-vi "C-k" select-pane -U
      bind-key -T copy-mode-vi "C-l" select-pane -R
      bind-key -T copy-mode-vi "C-\" select-pane -l

      # Vi mode in copy 
      setw -g mode-keys vi

      # DESIGN TWEAKS

      # don"t do anything when a "bell" rings
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      setw -g monitor-activity off
      set -g bell-action none

      # copy mode
      setw -g mode-style "fg=colour1 bg=colour12 bold"

      # pane borders
      set -g pane-border-style "fg=colour0"
      set -g pane-active-border-style "fg=colour8"

      # statusbar
      set -g status-position top 
      set -g status-justify left
      set -g status-style "fg=colour15"
      set -g status-left ""
      set -g status-left-length 10
      set -g status-right ""

      setw -g window-status-current-style "fg=colour0 bg=colour12 bold"
      setw -g window-status-current-format " #I #W #F "

      setw -g window-status-style "fg=colour12 dim"
      setw -g window-status-format " #I #[fg=colour12]#W #[fg=colour12]#F "

      setw -g window-status-bell-style "fg=colour2 bg=colour4 bold"

      # messages
      set -g message-style "fg=colour2 bg=colour0 bold"
    '';
  };
}
