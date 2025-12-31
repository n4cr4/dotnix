{ ... }:
{
  programs.nixvim.plugins.comment = {
    enable = true;
    settings = {
      toggler = {
        line = "gcc";
        block = "gbc";
      };
      opleader = {
        line = "gc";
        block = "gb";
      };
    };
  };
}
