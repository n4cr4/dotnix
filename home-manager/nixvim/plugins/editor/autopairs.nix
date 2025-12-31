{ ... }:
{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
    settings = {
      check_ts = true;
      ts_config = {
        lua = [ "string" "source" ];
        javascript = [ "string" "template_string" ];
      };
    };
  };
}
