{pkgs, ...}: {
  config = {
    vim = {
      keymaps = [
        {
          key = "<A-q>";
          mode = "n";
          silent = true;
          action = "<Plug>(qf_qf_toggle)";
          desc = "Toggle quickfix window";
        }
      ];
      extraPlugins = with pkgs.vimPlugins; {
        vim-qf = {
          package = vim-qf;
        };
      };
    };
  };
}
