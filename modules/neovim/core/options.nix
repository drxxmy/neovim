{
  config = {
    vim = {
      clipboard = {
        enable = true;
        registers = "unnamed,unnamedplus";
      };
      options = {
        # General
        scrolloff = 8;

        # Tab Settings
        tabstop = 2;
        softtabstop = 2;
        showtabline = 2;
        expandtab = true;

        # Indentation
        smartindent = true;
        shiftwidth = 2;
        breakindent = true;

        # Search
        incsearch = true;
        hlsearch = false;
        ignorecase = true;
        smartcase = true;

        # Fold Settings
        foldcolumn = "1";
        foldlevel = 99;
        foldlevelstart = 99;
        foldenable = false;

        # UI
        number = true;
        relativenumber = true;
        cursorline = true;
        splitbelow = true;
        splitright = true;
      };
    };
  };
}
