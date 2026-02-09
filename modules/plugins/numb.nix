{ pkgs, ... }:
{
  config.vim.extraPlugins = {
    numb-nvim = {
      package = pkgs.vimPlugins.numb-nvim;
      setup = "require('numb').setup()";
    };
  };
}
