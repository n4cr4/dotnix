{ pkgs, config, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  xdg.configFile = {
    "nvim/init.lua".source = ./nvim/init.lua;
    "nvim/lua".source = ./nvim/lua;
    "nvim/snippets".source = ./nvim/snippets;
  };
}
