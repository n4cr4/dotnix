{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    delta
    eza
    fd
    ripgrep
    fzf
    ghq
    lazygit
    lazydocker
    duf
    jq
    zoxide
    zip
    unzip
    neovim
  ];
}
