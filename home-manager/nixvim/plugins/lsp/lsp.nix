{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          # Nix
          nil_ls = {
            enable = true;
            settings = {
              formatting.command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
            };
          };

          # Python
          pyright.enable = true;

          # C/C++
          clangd.enable = true;

          # Docker
          dockerls.enable = true;

          # Terraform
          terraformls.enable = true;

          # JSON
          jsonls.enable = true;

          # Lua
          lua_ls = {
            enable = true;
            settings.telemetry.enable = false;
          };

          # TypeScript/JavaScript
          ts_ls.enable = true;

          # HTML/CSS
          html.enable = true;
          cssls.enable = true;

          # Bash
          bashls.enable = true;

          # YAML
          yamlls.enable = true;

          # Markdown
          marksman.enable = true;
        };

        keymaps = {
          diagnostic = {
            "<leader>ld" = "open_float";
            "[d" = "goto_prev";
            "]d" = "goto_next";
            "<leader>lq" = "setloclist";
          };
          lspBuf = {
            "gd" = "definition";
            "gD" = "declaration";
            "gr" = "references";
            "gi" = "implementation";
            "gt" = "type_definition";
            "K" = "hover";
            "<leader>lh" = "signature_help";
            "<leader>lr" = "rename";
            "<leader>la" = "code_action";
            "<leader>lf" = "format";
          };
        };
      };

      # LSP UI improvements
      lsp-lines.enable = true;
      fidget.enable = true;
    };
  };
}
