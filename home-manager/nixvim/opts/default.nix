{ ... }:
{
  programs.nixvim = {
    # Global options
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      autoformat = false;
      snacks_animate = false;

      # Disable default plugins
      loaded_gzip = 1;
      loaded_zip = 1;
      loaded_zipPlugin = 1;
      loaded_tar = 1;
      loaded_tarPlugin = 1;
      loaded_getscript = 1;
      loaded_getscriptPlugin = 1;
      loaded_vimball = 1;
      loaded_vimballPlugin = 1;
      loaded_2html_plugin = 1;
      loaded_matchit = 1;
      loaded_matchparen = 1;
      loaded_logiPat = 1;
      loaded_rrhelper = 1;
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
      loaded_netrwSettings = 1;
      loaded_netrwFileHandlers = 1;
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
      laststatus = 3; # Global statusline
      cmdheight = 0; # Hide command line when not in use

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
