{
  config = {
    vim = {
      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          enable_cursor_hijack = true;
          git_status_async = true;
          filesystem = {
            filtered_items = {
              visible = true;
            };
          };
        };
      };
      keymaps = [
        {
          key = "<leader>e";
          mode = "n";
          silent = true;
          action = "<cmd>Neotree toggle<cr>";
          desc = "Toggle Neotree";
        }
      ];
    };
  };
}
