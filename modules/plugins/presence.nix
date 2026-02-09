{ pkgs, ... }:
{
  config.vim.extraPlugins = {
    presence-nvim = {
      package = pkgs.vimPlugins.presence-nvim;
      setup = "require('presence').setup({})";
    };
  };
}
