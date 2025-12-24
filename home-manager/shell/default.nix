{ pkgs, ... }:
{
  home.packages = with pkgs; [
    starship
  ];

  # Manage zsh config files
  home.file = {
    ".config/sheldon/config".source = ./config;
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = false; # sheldon manages compinit
    initExtra = ''
      eval "$(sheldon source)"
    '';
  };

  programs.sheldon = {
    enable = true;
    settings = {
      shell = "zsh";

      plugins = {
        # Completions (renamed to load first)
        "00-compinit" = {
          inline = ''
            autoload bashcompinit && bashcompinit
            autoload -Uz compinit && compinit
          '';
        };

        # Config files
        config = {
          local = "~/.config/sheldon/config";
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
