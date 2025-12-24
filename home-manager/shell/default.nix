{ pkgs, ... }:
{
  home.packages = with pkgs; [
    starship
  ];

  # Manage zsh config files
  home.file = {
    ".config/zsh/alias.zsh".source = ./config/alias.zsh;
    ".config/zsh/ghq-fzf.zsh".source = ./config/ghq-fzf.zsh;
    ".config/zsh/options.zsh".source = ./config/options.zsh;
    ".config/zsh/tmux.zsh".source = ./config/tmux.zsh;
    ".config/zsh/env.zsh".source = ./config/env.zsh;
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initContent = ''
      # Source custom config files
      for config_file in ~/.config/zsh/{env,options,alias,ghq-fzf,tmux}.zsh; do
        [[ -f "$config_file" ]] && source "$config_file"
      done

      eval "$(sheldon source)"
    '';
  };

  programs.sheldon = {
    enable = true;
    settings = {
      shell = "zsh";

      plugins = {
        # Completions
        compinit = {
          inline = ''
            autoload bashcompinit && bashcompinit
            autoload -Uz compinit && compinit
          '';
        };

        fzf-tab = {
          github = "Aloxaf/fzf-tab";
        };

        zsh-autosuggestions = {
          github = "zsh-users/zsh-autosuggestions";
        };

        zsh-completions = {
          github = "zsh-users/zsh-completions";
        };

        # Tool integrations
        starship = {
          inline = ''eval "$(starship init zsh)"'';
        };

        zoxide = {
          inline = ''eval "$(zoxide init zsh)"'';
        };

        fzf = {
          inline = ''source <(fzf --zsh)'';
        };

        aws = {
          inline = ''complete -C aws_completer aws'';
        };
      };
    };
  };
}
