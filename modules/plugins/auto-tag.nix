{ pkgs, ... }:
{
  config.vim.lazy.plugins = {
    nvim-ts-autotag = {
      package = pkgs.vimPlugins.nvim-ts-autotag;
      setupModule = "nvim-ts-autotag";
      setupOpts = {
        opts = {
          enable_close = true; # Auto close tags
          enable_rename = true; # Auto rename pairs of tags
          enable_close_on_slash = true; # Auto close on trailing </
        };
      };
      event = [ "InsertEnter" ];
      ft = [
        "html"
        "xml"
        "javascript"
        "typescript"
        "javascriptreact"
        "typescriptreact"
        "svelte"
        "vue"
      ];
    };
  };
}
