{ pkgs, ... }:
{
  config.vim.lazy.plugins = {
    nvim-surround = {
      package = pkgs.vimPlugins.nvim-surround;
      setupModule = "nvim-surround";

      # Lazy-load on first surround key usage
      keys = [
        {
          key = "ys";
          mode = "n";
        }
        {
          key = "cs";
          mode = "n";
        }
        {
          key = "ds";
          mode = "n";
        }
        {
          key = "S";
          mode = "v";
        }
      ];
    };
  };
}
