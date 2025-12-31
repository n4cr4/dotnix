{ ... }:
{
  programs.nixvim = {
    # Global options
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      autoformat = false;
      snacks_animate = false;
    };

    # General options
    opts = {
      # Line numbers
      number = true;
      relativenumber = true;

      # Tabs and indentation
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;

      # Search settings
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      # Appearance
      termguicolors = true;
      signcolumn = "yes";
      wrap = true;
      conceallevel = 0;
      cursorline = true;

      # Behavior
      mouse = "";
      clipboard = "unnamedplus";
      undofile = true;
      backup = false;
      writebackup = false;
      swapfile = false;

      # Completion
      completeopt = "menu,menuone,noselect";

      # Spell checking
      spell = true;
      spelllang = "en,cjk";

      # Split windows
      splitright = true;
      splitbelow = true;

      # Performance
      updatetime = 250;
      timeoutlen = 300;

      # Folding
      foldmethod = "expr";
      foldexpr = "nvim_treesitter#foldexpr()";
      foldenable = false; # Disable folding by default when opening files
      foldlevel = 99;
      foldlevelstart = 99;
    };
  };
}
