{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sheldon
    starship
  ];
  home.file = {
    ".config/sheldon/plugins.toml".source = ./plugins.toml;
    ".config/sheldon/config".source = ./config;
  };
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtra = ''
      eval "$(sheldon source)"
    '';
  };
}
