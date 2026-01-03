{ pkgs, ... }:
{
  config = {
    vim = {
      extraPlugins = with pkgs.vimPlugins; {
        presence-nvim = {
          package = presence-nvim;
          setup = "require('presence').setup({})";
        };
      };
    };
  };
}
