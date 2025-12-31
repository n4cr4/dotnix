{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./dev.nix
    ./direnv.nix
    ./git.nix
    ./tools.nix
    ./shell
    ./nixvim
    ./dotfile
    ./tmux.nix
    ./ai
  ];
}
