{ ... }:
{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      delay = 300;
      spec = [
        {
          __unkeyed-1 = "<leader>f";
          group = "Find";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "LSP";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffer";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Code";
        }
      ];
    };
  };
}
