{ ... }:
{
  imports = [
    ./alpha.nix
    ./lualine.nix
    ./bufferline.nix
    ./telescope.nix
    ./which-key.nix
    ./neo-tree.nix
  ];

  # Explicitly enable web-devicons
  programs.nixvim.plugins.web-devicons.enable = true;
}
