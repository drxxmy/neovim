{pkgs, ...}: {
  config = {
    vim = {
      extraPlugins = with pkgs.vimPlugins; {
        nvim-bqf = {
          package = nvim-bqf;
          setup = ''
            require('bqf').setup({
              auto_resize_height = true,
              preview = {
                win_height = 999, -- Preview occupy fullsreen
              },
            })'';
        };
      };
    };
  };
}
