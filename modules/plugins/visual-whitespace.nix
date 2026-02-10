{ pkgs, ... }:
{
  config.vim.lazy.plugins = {
    "visual-whitespace.nvim" = {
      package = pkgs.vimPlugins.visual-whitespace-nvim;
      event = [
        "ModeChanged"
      ];
    };
  };
}
