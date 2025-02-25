{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    go
    nodejs
    pnpm
    typst
    rustc
    cargo
  ];
}
