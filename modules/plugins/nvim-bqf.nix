{ pkgs, ... }:
{
  config.vim.lazy.plugins = {
    nvim-bqf = {
      package = pkgs.vimPlugins.nvim-bqf;
      setupModule = "bqf";
      setupOpts = {
        auto_resize_height = true;
        preview = {
          win_height = 999;
        };
      };

      # Load only when quickfix window opens
      ft = [ "qf" ];
    };
  };
}
