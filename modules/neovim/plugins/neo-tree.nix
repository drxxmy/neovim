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
              hide_by_name = [
                "__pycache__"
              ];

              never_show = [
                "__pycache__"
              ];
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
