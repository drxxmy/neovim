{ pkgs, ... }:
{
  config.vim.extraPlugins = {
    dropbar-nvim = {
      package = pkgs.vimPlugins.dropbar-nvim;
    };
  };
}
