{ ... }:
{
  programs.nixvim.plugins.alpha = {
    enable = true;
    settings.layout = [
      {
        type = "padding";
        val = 8;
      }
      {
        type = "text";
        val = [
          "████████╗██████╗ ██╗   ██╗    ██╗  ██╗ █████╗ ██████╗ ██████╗ ███████╗██████╗ "
          "╚══██╔══╝██╔══██╗╚██╗ ██╔╝    ██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗"
          "   ██║   ██████╔╝ ╚████╔╝     ███████║███████║██████╔╝██║  ██║█████╗  ██████╔╝"
          "   ██║   ██╔══██╗  ╚██╔╝      ██╔══██║██╔══██║██╔══██╗██║  ██║██╔══╝  ██╔══██╗"
          "   ██║   ██║  ██║   ██║       ██║  ██║██║  ██║██║  ██║██████╔╝███████╗██║  ██║"
          "   ╚═╝   ╚═╝  ╚═╝   ╚═╝       ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝"
        ];
        opts = {
          position = "center";
          hl = "Type";
        };
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
        val = [
          {
            type = "button";
            val = "  Find File";
            on_press = {
              __raw = "function() require('telescope.builtin').find_files() end";
            };
            opts = {
              keymap = [
                "n"
                "f"
                ":Telescope find_files<CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "f";
              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  Recent Files";
            on_press = {
              __raw = "function() require('telescope.builtin').oldfiles() end";
            };
            opts = {
              keymap = [
                "n"
                "r"
                ":Telescope oldfiles<CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "r";
              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  Quit";
            on_press = {
              __raw = "function() vim.cmd('qa') end";
            };
            opts = {
              keymap = [
                "n"
                "q"
                ":qa<CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "q";
              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
        ];
      }
    ];
  };
}
