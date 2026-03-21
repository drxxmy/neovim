{ pkgs, ... }:
{
  config.vim = {
    extraPackages = with pkgs; [
      vtsls # typescript
      vue-language-server # vue
      tailwindcss-language-server # tailwindcss
    ];
    languages = {
      html.enable = true;
      tailwind.enable = true;
      css = {
        enable = true;
        format.type = [ "prettierd" ];
      };
      ts = {
        lsp.enable = false; # since we use vtsls
        extraDiagnostics.enable = true;
      };
    };
    lsp.servers = {
      cssls = {
        settings =
          let
            ignoreUnknownAtRules = {
              lint.unknownAtRules = "ignore";
            };
          in
          {
            css = ignoreUnknownAtRules;
            scss = ignoreUnknownAtRules;
            less = ignoreUnknownAtRules;
          };
      };
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
          "typescript"
          "javascriptreact"
          "typescriptreact"
          "vue"
        ];
      };
    };
  };
}
