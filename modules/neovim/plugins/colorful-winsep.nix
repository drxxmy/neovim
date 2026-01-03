{pkgs, ...}: {
  config = {
    vim = {
      extraPlugins = with pkgs.vimPlugins; {
        colorful-winsep-nvim = {
          package = colorful-winsep-nvim;
          setup = "require('colorful-winsep').setup()";
        };
      };
    };
  };
}
