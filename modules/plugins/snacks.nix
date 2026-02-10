{
  config.vim = {
    utility.snacks-nvim.enable = true;
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
}
