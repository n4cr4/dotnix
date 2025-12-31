{ lib, ... }:
{
  programs.nixvim = {
    plugins.vimtex = {
      enable = true;
      settings = {
        view_method = "sioyek";
        view_sioyek_exe = "sioyek.exe";
        callback_progpath = lib.mkForce "~/.local/share/mise/installs/neovim/latest/bin/nvim";
        mappings_disable = {
          n = [ "K" ]; # disable K as it conflicts with LSP hover
        };
      };
    };
  };
}
