{ pkgs, ... }:
{
  config.vim.extraPlugins = {
    nvim-surround = {
      package = pkgs.vimPlugins.nvim-surround;
      setup = "require('nvim-surround').setup()";
    };
  };
}
