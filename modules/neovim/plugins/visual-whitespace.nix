{ pkgs, ... }:
{
  config = {
    vim = {
      extraPlugins = with pkgs.vimPlugins; {
        visual-whitespace-nvim = {
          package = visual-whitespace-nvim;
        };
      };
    };
  };
}
