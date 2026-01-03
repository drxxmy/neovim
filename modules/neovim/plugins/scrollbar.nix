{pkgs, ...}: {
  config = {
    vim = {
      extraPlugins = with pkgs.vimPlugins; {
        nvim-scrollbar = {
          package = nvim-scrollbar;
          setup = "require('scrollbar').setup()";
        };
      };
    };
  };
}
