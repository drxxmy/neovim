{
  config.vim = {
    options = {
      # Project-local configuration
      exrc = true;

      # General
      scrolloff = 8;

      # Indentation
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
      autoindent = true;
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
}
