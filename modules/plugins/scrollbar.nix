{ pkgs, ... }:
{
  config.vim.extraPlugins = {
    nvim-scrollbar = {
      package = pkgs.vimPlugins.nvim-scrollbar;
      setup = "require('scrollbar').setup()";
    };
  };
}
