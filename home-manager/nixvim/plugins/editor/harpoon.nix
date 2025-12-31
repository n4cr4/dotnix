{ ... }:
{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>ha";
        action.__raw = "function() require('harpoon'):list():add() end";
        options.desc = "Add file to harpoon";
      }
      {
        mode = "n";
        key = "<leader>hm";
        action.__raw = "function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end";
        options.desc = "Toggle harpoon menu";
      }
      {
        mode = "n";
        key = "<leader>h1";
        action.__raw = "function() require('harpoon'):list():select(1) end";
        options.desc = "Harpoon file 1";
      }
      {
        mode = "n";
        key = "<leader>h2";
        action.__raw = "function() require('harpoon'):list():select(2) end";
        options.desc = "Harpoon file 2";
      }
      {
        mode = "n";
        key = "<leader>h3";
        action.__raw = "function() require('harpoon'):list():select(3) end";
        options.desc = "Harpoon file 3";
      }
      {
        mode = "n";
        key = "<leader>h4";
        action.__raw = "function() require('harpoon'):list():select(4) end";
        options.desc = "Harpoon file 4";
      }
    ];
  };
}
