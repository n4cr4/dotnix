{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    go
    nodejs-slim
    pnpm
    typst
    rustc
    cargo
  ];
}
