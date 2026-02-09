{ pkgs, ... }:
{
  config.vim.extraPlugins = {
    visual-whitespace-nvim = {
      package = pkgs.vimPlugins.visual-whitespace-nvim;
    };
  };
}
