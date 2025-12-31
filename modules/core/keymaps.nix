{
  config = {
    vim = {
      keymaps = [
        # Split navigation
        {
          key = "<C-h>";
          mode = "n";
          silent = true;
          action = "<C-w>h";
          desc = "Move to the left split";
        }
        {
          key = "<C-l>";
          mode = "n";
          silent = true;
          action = "<C-w>l";
          desc = "Move to the right split";
        }
        {
          key = "<C-j>";
          mode = "n";
          silent = true;
          action = "<C-w>j";
          desc = "Move to the bottom split";
        }
        {
          key = "<C-k>";
          mode = "n";
          silent = true;
          action = "<C-w>k";
          desc = "Move to the top split";
        }
      ];
    };
  };
}
