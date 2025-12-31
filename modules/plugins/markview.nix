{
  config = {
    vim = {
      languages.markdown = {
        enable = true;
        extensions.markview-nvim = {
          enable = true;
        };
      };
      keymaps = [
        {
          key = "<leader>m";
          mode = "n";
          silent = true;
          action = "<cmd>Markview toggle<cr>";
          desc = "Toggle Markdown preview";
        }
      ];
    };
  };
}
