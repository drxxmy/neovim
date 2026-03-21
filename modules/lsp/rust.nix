{
  config.vim = {
    languages.rust = {
      enable = true;
      extensions = {
        crates-nvim = {
          enable = true;
          setupOpts = {
            lsp = {
              enabled = true;
              actions = true;
              completion = true;
              hover = true;
            };
          };
        };
      };
    };
  };
}
