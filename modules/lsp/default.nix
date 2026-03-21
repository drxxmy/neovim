{ mylib, ... }:
{
  imports = mylib.scanPaths ./.;

  config.vim = {
    languages = {
      enableTreesitter = true;
      enableDAP = true;
      enableFormat = true;
    };
    lsp = {
      enable = true;
      formatOnSave = true;
      lspconfig.enable = true;
      lspkind.enable = true;
      mappings = {
        codeAction = "gra";
        goToDeclaration = "grD";
        goToDefinition = "grd";
        hover = "K";
        listImplementations = "gri";
        listReferences = "gri";
        renameSymbol = "grn";
        signatureHelp = "<C-s>";
      };
    };
    keymaps = [
      {
        key = "<leader>it";
        mode = "n";
        silent = true;
        action = ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>";
        desc = "Toggle inlay hints";
      }
    ];
  };
}
