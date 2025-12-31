{ ... }:
{
  imports = [
    ./ui
    ./lsp
    ./editor
    ./lang
  ];

  programs.nixvim = {
    # Colorscheme
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "moon";
        transparent = false;
      };
    };
  };
}
