{ pkgs, ... }:
{
  config.vim = {
    lazy.plugins = {
      vim-qf = {
        package = pkgs.vimPlugins.vim-qf;

        # Load only when quickfix window opens
        ft = [ "qf" ];
      };
    };
    keymaps = [
      {
        key = "<A-q>";
        mode = "n";
        silent = true;
        action = "<Plug>(qf_qf_toggle)";
        desc = "Toggle quickfix window";
      }
    ];
  };
}
