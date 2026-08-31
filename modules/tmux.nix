{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 0;
    clock24 = false;
    extraConfig = ''
      set -g default-terminal "screen-256color"
      set -g set-clipboard on
      set -g mouse on

      bind e split-window -h -c "#{pane_current_path}"
      bind q split-window -v -c "#{pane_current_path}"

      # Switch panes instantly using Alt + WASD (Pure left hand)
      bind -n M-a select-pane -L
      bind -n M-s select-pane -D
      bind -n M-w select-pane -U
      bind -n M-d select-pane -R

       # Resize panes instantly using Ctrl + Alt + WASD (Pure left hand)
      bind -n M-C-a resize-pane -L 5
      bind -n M-C-s resize-pane -D 5
      bind -n M-C-w resize-pane -U 5
      bind -n M-C-d resize-pane -R 5

      # Alt+number to select window
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
    '';
  };
}
