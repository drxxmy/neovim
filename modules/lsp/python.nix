{
  config.vim.languages.python = {
    enable = true;
    lsp.servers = [ "pyright" ];
    format.type = [
      "black"
      "isort"
    ];
  };
}
