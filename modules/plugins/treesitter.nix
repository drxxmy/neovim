{ pkgs, ... }:
{
  config.vim.treesitter = {
    enable = true;
    textobjects = {
      enable = true;
    };
    grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
}
