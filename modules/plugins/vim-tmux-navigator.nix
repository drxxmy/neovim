{pkgs, ...}: {
  config = {
    vim = {
      extraPlugins = with pkgs.vimPlugins; {
        vim-tmux-navigator = {
          package = vim-tmux-navigator;
        };
      };
      keymaps = [
        {
          key = "<c-h>";
          mode = "n";
          silent = true;
          action = "<cmd><C-U>TmuxNavigateLeft<cr>";
        }
        {
          key = "<c-j>";
          mode = "n";
          silent = true;
          action = "<cmd><C-U>TmuxNavigateDown<cr>";
        }
        {
          key = "<c-k>";
          mode = "n";
          silent = true;
          action = "<cmd><C-U>TmuxNavigateUp<cr>";
        }
        {
          key = "<c-l>";
          mode = "n";
          silent = true;
          action = "<cmd><C-U>TmuxNavigateRight<cr>";
        }
        {
          key = "<c-\\>";
          mode = "n";
          silent = true;
          action = "<cmd><C-U>TmuxNavigatePrevious<cr>";
        }
      ];
    };
  };
}
