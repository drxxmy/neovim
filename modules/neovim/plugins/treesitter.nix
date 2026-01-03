{ pkgs, ... }:
{
  config = {
    vim = {
      treesitter = {
        enable = true;
        textobjects = {
          enable = true;
        };
        mappings.incrementalSelection = {
          init = "<C-n>";
          incrementByNode = "<C-n>";
          decrementByNode = "<bs>";
        };
        grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      };
    };
  };
}
