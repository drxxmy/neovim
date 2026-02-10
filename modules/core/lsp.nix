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
      nixfmt
      vue-language-server
      vtsls
      tailwindcss-language-server
      lua-language-server
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
        nixd = { };
        lua_ls = { };
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
      # html.enable = true; # NOTE: broken
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
