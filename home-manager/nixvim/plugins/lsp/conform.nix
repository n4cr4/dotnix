{ pkgs, ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        python = [ "black" "isort" ];
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        javascriptreact = [ "prettier" ];
        typescriptreact = [ "prettier" ];
        json = [ "prettier" ];
        html = [ "prettier" ];
        css = [ "prettier" ];
        markdown = [ "prettier" ];
        yaml = [ "prettier" ];
        lua = [ "stylua" ];
        sh = [ "shfmt" ];
      };
      format_on_save = {
        lsp_fallback = true;
        timeout_ms = 500;
      };
    };
  };

  # Add formatter packages
  home.packages = with pkgs; [
    nixfmt-rfc-style
    black
    isort
    nodePackages.prettier
    stylua
    shfmt
  ];
}
