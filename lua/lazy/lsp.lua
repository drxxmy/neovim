return {
  {
    "lspsaga.nvim",
    event = "BufReadPost",
    after = function()
      require("lspsaga").setup({
        code_action = {
          show_server_name = true,
        },
        symbol_in_winbar = {
          enable = false,
        },
        lightbulb = { virtual_text = false },
      })
    end,
    keys = {
      {
        "gra",
        "<cmd>Lspsaga code_action<cr>",
        mode = { "n", "v" },
      },
    },
  },
  {
    "nvim-lspconfig",
    event = "DeferredUIEnter",
    before = function()
      local lzn = require("lz.n")
      lzn.trigger_load("blink.cmp")
      lzn.trigger_load("snacks")
    end,
    after = function()
      -- Enable lspconfig
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = true,
        virtual_lines = { current_line = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          },
          linehl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          },
          numhl = {
            [vim.diagnostic.severity.WARN] = "WarningMsg",
          },
        },
      })

      -- Enable LSP
      vim.lsp.enable({ "nixd", "lua_ls", "just", "marksman", "clangd" })
    end,
  },
}
