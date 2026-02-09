{ pkgs, ... }:
{
  config.vim.extraPlugins = {
    colorful-winsep-nvim = {
      package = pkgs.vimPlugins.colorful-winsep-nvim;
      setup = "require('colorful-winsep').setup()";
    };
  };
}
