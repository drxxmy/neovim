{ pkgs, ... }:
{
  config = {
    vim = {
      extraPlugins = with pkgs.vimPlugins; {
        numb-nvim = {
          package = numb-nvim;
          setup = "require('numb').setup()";
        };
      };
    };
  };
}
