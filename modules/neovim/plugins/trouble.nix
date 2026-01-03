{
  config = {
    vim = {
      keymaps = [
        {
          key = "<leader>x";
          mode = "n";
          silent = true;
          action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
          desc = "Buffer diagnostics (Trouble)";
        }
        {
          key = "<leader>X";
          mode = "n";
          silent = true;
          action = "<cmd>Trouble diagnostics toggle<cr>";
          desc = "Diagnostics (Trouble)";
        }
        {
          key = "<leader>s";
          mode = "n";
          silent = true;
          action = "<cmd>Trouble symbols toggle focus=false<cr>";
          desc = "Symbols (Trouble)";
        }
        {
          key = "<leader>d";
          mode = "n";
          silent = true;
          action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
          desc = "LSP Definitions / references / ... (Trouble)";
        }
        {
          key = "<leader>z";
          mode = "n";
          silent = true;
          action = "<cmd>Trouble todo toggle<cr>";
          desc = "TODO list (Trouble)";
        }
      ];
      lsp = {
        trouble = {
          enable = true;
          mappings = {
            documentDiagnostics = null;
            locList = null;
            lspReferences = null;
            quickfix = null;
            symbols = null;
            workspaceDiagnostics = null;
          };
        };
      };
    };
  };
}
