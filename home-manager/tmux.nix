{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-t";
    sensibleOnTop = true;
    historyLimit = 100000;
    escapeTime = 0;
    focusEvents = true;
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    resizeAmount = 5;
    aggressiveResize = true;
    terminal = "tmux-256color";
    extraConfig = ''
      set-option -ga terminal-overrides ",xterm-256color:RGB"
      set -g extended-keys on
      set -s user-keys[0] "\e[13;5u"
      bind -n User0 send-keys -l "\e[13;5u"
      bind -r m resize-pane -Z

      set -g set-clipboard on
      set -g allow-passthrough on

      # --- status bar ---
      set -g status-position bottom
      set -g status-style "bg=#1a1b26,fg=#a9b1d6"
      set -g status-left "#[fg=#7aa2f7,bold] #S "
      set -g status-left-length 30
      set -g status-right "#[fg=#565f89] %Y-%m-%d #[fg=#7aa2f7]%H:%M "
      set -g status-right-length 50
      set -g window-status-format "#[fg=#565f89] #I:#W "
      set -g window-status-current-format "#[fg=#7aa2f7,bold] #I:#W "
      set -g window-status-separator ""

      # move window
      bind-key -n C-S-Left swap-window -t -1 \; previous-window
      bind-key -n C-S-Right swap-window -t +1 \; next-window

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
