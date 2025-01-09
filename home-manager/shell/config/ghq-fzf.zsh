function ghq-fzf_change_directory() {
  local src=$(ghq list | fzf --preview "eza -l -g -a --icons $(ghq root)/{} | tail -n+2 | awk '{print \$6\"/\"\$8\" \"\$9 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}

zle -N ghq-fzf_change_directory
bindkey '^f' ghq-fzf_change_directory
