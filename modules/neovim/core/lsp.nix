{ pkgs, ... }:
let
  vue_plugin = {
    name = "@vue/typescript-plugin";
    location = "${pkgs.vue-language-server}/lib/language-tools/packages/language-server";
    languages = [ "vue" ];
    configNamespace = "typescript";
  };
in
{
  config = {
    vim = {
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
        python313Packages.python-lsp-server
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
        inlayHints.enable = true;
        lspconfig = {
          enable = true;
        };
        lspkind = {
          enable = true;
        };
        servers = {
          tailwindcss = { };
          vtsls = {
            settings = {
              vtsls = {
                tsserver = {
                  globalPlugins = [
                    vue_plugin
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
          pylsp = { };
          nil_ls = { };
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
        # python = {
        #   enable = true;
        #   lsp = {
        #     enable = true;
        #   };
        # };
        html.enable = true;
        lua.enable = true;
        php.enable = true;
        clang.enable = true;
      };
    };
  };
}
