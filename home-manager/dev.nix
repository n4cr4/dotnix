{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    go
    python312
    python312Packages.pip
    poetry
    nodejs-slim
    pnpm
  ];
}
