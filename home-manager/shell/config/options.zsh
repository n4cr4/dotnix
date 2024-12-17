HISTSIZE=10000
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"
HISTDUP=erase
setopt appendhistory
setopt autocd
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
bindkey -v
