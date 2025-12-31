{
  config = {
    vim = {
      utility.snacks-nvim.enable = true;
      tabline.nvimBufferline = {
        enable = true;
        mappings = {
          cyclePrevious = "<A-h>";
          cycleNext = "<A-l>";
          movePrevious = "<A-,>";
          moveNext = "<A-.>";
          pick = "<A-p>";
        };
        setupOpts = {
          options = {
            numbers = "none";
            max_name_length = 16;
            tab_size = 16;
          };
        };
      };
      keymaps = [
        {
          key = "<A-c>";
          mode = "n";
          silent = true;
          action = ":lua Snacks.bufdelete.delete()<cr>";
          desc = "Close current buffer";
        }
      ];
    };
  };
}
