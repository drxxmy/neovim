{ pkgs, ... }:
{
  config.vim.extraPlugins = {
    nvim-bqf = {
      package = pkgs.vimPlugins.nvim-bqf;
      setup = ''
        require('bqf').setup({
          auto_resize_height = true,
          preview = {
            win_height = 999, -- Preview occupy fullsreen
          },
        })'';
    };
  };
}
