{
  config.vim = {
    languages.nix = {
      enable = true;
      extraDiagnostics.enable = true;
      format.type = [ "nixfmt" ];
      lsp.servers = [ "nixd" ];
    };
  };
}
