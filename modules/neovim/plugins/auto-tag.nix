{pkgs, ...}: {
  config = {
    vim = {
      extraPlugins = with pkgs.vimPlugins; {
        nvim-ts-autotag = {
          package = nvim-ts-autotag;
          setup = ''
            require('nvim-ts-autotag').setup({
              opts = {
                -- Defaults
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = true, -- Auto close on trailing </
              },
            })
          '';
        };
      };
    };
  };
}
