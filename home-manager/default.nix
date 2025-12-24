{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./dev.nix
    ./direnv.nix
    ./git.nix
    ./tools.nix
    ./shell
    ./editor
    ./dotfile
    ./tmux.nix
    ./ai
  ];
}
