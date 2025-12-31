{ ... }:
{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        mode = "buffers";
        diagnostics = "nvim_lsp";
        separator_style = "slant";
        always_show_bufferline = true;
        offsets = [
          {
            filetype = "neo-tree";
            text = "File Explorer";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };
  };
}
