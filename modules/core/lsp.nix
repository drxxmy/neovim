{ pkgs, lib, ... }:
{
  config.vim = {
    keymaps = [
      {
        key = "<leader>it";
        mode = "n";
        silent = true;
        action = ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>";
        desc = "Toggle inlay hints";
      }
    ];
    extraPackages = with pkgs; [
      nixd
      nil
      nixfmt
      vue-language-server
      vtsls
      tailwindcss-language-server
    ];
    lsp = {
      enable = true;
      formatOnSave = true;
      lspconfig.enable = true;
      lspkind.enable = true;
      servers = {
        tailwindcss = { };
        vtsls = {
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = [
                  {
                    name = "@vue/typescript-plugin";
                    location = "${pkgs.vue-language-server}/lib/language-tools/packages/language-server";
                    languages = [ "vue" ];
                    configNamespace = "typescript";
                  }
                ];
              };
            };
          };
          filetypes = [
            "javascript"
            "javascriptreact"
            "javascript.jsx"
            "typescript"
            "typescriptreact"
            "typescript.tsx"
            "vue"
          ];
        };
        vue_ls = { };
        nil_ls = {
          on_attach = lib.generators.mkLuaInline ''
            function(client, bufnr)
              -- Make nil_ls passive (hints + diagnostics only)
              client.server_capabilities.renameProvider = false
              client.server_capabilities.codeActionProvider = false
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          '';
        };
        nixd = { };
      };
      mappings = {
        codeAction = "gra";
        goToDeclaration = "grD";
        goToDefinition = "grd";
        hover = "K";
        listImplementations = "gri";
        listReferences = "gri";
        renameSymbol = "grn";
        signatureHelp = "<C-s>";
      };
    };
    languages = {
      rust.enable = true;
      ts.enable = true;
      python = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ "pyright" ];
        };
        format = {
          enable = true;
          type = [
            "black"
            "isort"
          ];
        };
        treesitter.enable = true;
      };
      html.enable = true;
      lua.enable = true;
      php.enable = true;
      clang = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ "ccls" ];
        };
        treesitter.enable = true;
      };
    };
  };
}
