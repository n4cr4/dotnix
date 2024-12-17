{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-t";
    sensibleOnTop = true;
    historyLimit = 100000;
    plugins = with pkgs; [
      tmuxPlugins.tokyo-night-tmux
    ];
    extraConfig = ''
      set-option -g default-terminal "tmux-256color"
      set-option -ga terminal-overrides ",xterm-256color:RGB"
      bind -r m resize-pane -Z

      # switching pane
      bind -r k select-pane -U 
      bind -r j select-pane -D 
      bind -r h select-pane -L 
      bind -r l select-pane -R

      # move window
      bind-key -n C-S-Left swap-window -t -1 \; previous-window
      bind-key -n C-S-Right swap-window -t +1 \; next-window

      # resize pane
      bind -r C-k resize-pane -U 5
      bind -r C-j resize-pane -D 5
      bind -r C-h resize-pane -L 5
      bind -r C-l resize-pane -R 5

      # split horizontal
      bind \\ split-window -h -c '#{pane_current_path}'
      # split vertical
      bind - split-window -v -c '#{pane_current_path}'

      # create window in current pane
      bind c new-window -c '#{pane_current_path}'

      # copy mode
      # `prefix-[` to enter copy mode
      bind -T copy-mode-vi v send-keys -X begin-selection # `v` to normal select
      bind -T copy-mode-vi V send-keys -X select-line # `V` to line select
      bind -T copy-mode-vi Escape send-keys -X clear-selection # `Esc` to cancel select

      # vim `viw` like selection
      bind -T copy-mode-vi i switch-client -T copyModeMultiKey_i
      bind -T copyModeMultiKey_i w send-keys -X select-word
      bind -T copyModeMultiKey_i W send-keys -X clear-selection \; send-keys -X previous-space \; send-keys -X begin-selection \; send-keys -X next-space-end
      bind -T copyModeMultiKey_i ( send-keys -X clear-selection \; send-keys -X jump-to-backward '(' \; send-keys -X begin-selection \; send-keys -X jump-to-forward ')'
      bind -T copyModeMultiKey_i ) send-keys -X clear-selection \; send-keys -X jump-to-backward '(' \; send-keys -X begin-selection \; send-keys -X jump-to-forward ')'
      bind -T copyModeMultiKey_i \{ send-keys -X clear-selection \; send-keys -X jump-to-backward '{' \; send-keys -X begin-selection \; send-keys -X jump-to-forward '}'
      bind -T copyModeMultiKey_i \} send-keys -X clear-selection \; send-keys -X jump-to-backward '{' \; send-keys -X begin-selection \; send-keys -X jump-to-forward '}'
      bind -T copyModeMultiKey_i [ send-keys -X clear-selection \; send-keys -X jump-to-backward '[' \; send-keys -X begin-selection \; send-keys -X jump-to-forward ']'
      bind -T copyModeMultiKey_i ] send-keys -X clear-selection \; send-keys -X jump-to-backward '[' \; send-keys -X begin-selection \; send-keys -X jump-to-forward ']'
      bind -T copyModeMultiKey_i < send-keys -X clear-selection \; send-keys -X jump-to-backward '<' \; send-keys -X begin-selection \; send-keys -X jump-to-forward '>'
      bind -T copyModeMultiKey_i > send-keys -X clear-selection \; send-keys -X jump-to-backward '<' \; send-keys -X begin-selection \; send-keys -X jump-to-forward '>'
      bind -T copyModeMultiKey_i ` send-keys -X clear-selection \; send-keys -X jump-to-backward '`' \; send-keys -X begin-selection \; send-keys -X jump-to-forward '`'
      bind -T copyModeMultiKey_i \' send-keys -X clear-selection \; send-keys -X jump-to-backward "'" \; send-keys -X begin-selection \; send-keys -X jump-to-forward "'"
      bind -T copyModeMultiKey_i \" send-keys -X clear-selection \; send-keys -X jump-to-backward '"' \; send-keys -X begin-selection \; send-keys -X jump-to-forward '"'
    '';
  };
}
