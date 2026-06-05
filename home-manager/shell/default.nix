{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    pure-prompt
  ];

  # Manage zsh config files
  home.file = {
    ".config/sheldon/config".source = ./config;
  };

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = false; # sheldon manages compinit
    initContent = ''
      # Restore Windows PATH stripped by pam_env.so via /etc/environment
      # under WSL2 systemd mode (see .omo/plans/fix-wsl-windows-path.md).
      if [ -d /mnt/c/Windows/System32 ]; then
        path+=(
          /mnt/c/Windows/System32
          /mnt/c/Windows
          /mnt/c/Windows/System32/Wbem
          /mnt/c/Windows/System32/WindowsPowerShell/v1.0
        )
      fi
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
            autoload -Uz compinit && compinit -C
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
        pure = {
          inline = ''autoload -U promptinit && promptinit && prompt pure'';
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
