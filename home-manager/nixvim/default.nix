{ pkgs, ... }:
{
  imports = [
    ./opts
    ./keymaps
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Performance optimization
    luaLoader.enable = true;
    performance.byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
  };

  home.shellAliases.v = "nvim";
}
