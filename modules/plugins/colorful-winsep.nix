{ pkgs, ... }:
{
  config.vim.lazy.plugins = {
    "colorful-winsep.nvim" = {
      package = pkgs.vimPlugins.colorful-winsep-nvim;
      setupModule = "colorful-winsep";
      event = [ "WinLeave" ];
    };
  };
}
