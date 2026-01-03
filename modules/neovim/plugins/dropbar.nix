{pkgs, ...}: {
  config = {
    vim = {
      extraPlugins = with pkgs.vimPlugins; {
        dropbar-nvim = {
          package = dropbar-nvim;
        };
      };
    };
  };
}
