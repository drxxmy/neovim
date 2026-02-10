{ pkgs, ... }:
{
  config.vim.lazy.plugins = {
    nvim-scrollbar = {
      package = pkgs.vimPlugins.nvim-scrollbar;
      setupModule = "scrollbar";
      event = [
        "BufReadPost"
        "BufNewFile"
      ];
    };
  };
}
