{ ... }:
{
  imports = [
    ./vimtex.nix
  ];

  programs.nixvim.plugins = {
    # Additional language support
    nix.enable = true;
    markdown-preview = {
      enable = true;
      settings = {
        auto_start = 0;
        auto_close = 1;
        theme = "dark";
      };
    };
  };
}
