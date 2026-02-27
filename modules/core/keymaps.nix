{
  config.vim.keymaps = [
    # Splits
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
    {
      key = "<leader>-";
      mode = "n";
      silent = true;
      action = "<cmd>horizontal split<cr>";
      desc = "Split buffer horizontally";
    }
    {
      key = "<leader>|";
      mode = "n";
      silent = true;
      action = "<cmd>vertical split<cr>";
      desc = "Split buffer vertically";
    }
    # Buffers
    {
      key = "<M-h>";
      mode = "n";
      silent = true;
      action = "<cmd>bprevious<cr>";
      desc = "Move to previous buffer";
    }
    {
      key = "<M-l>";
      mode = "n";
      silent = true;
      action = "<cmd>bnext<cr>";
      desc = "Move to next buffer";
    }
  ];
}
