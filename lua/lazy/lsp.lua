return {
  {
    "nvim-lspconfig",
    event = "DeferredUIEnter",
  },
  {
    "none-ls.nvim",
    event = "DeferredUIEnter",
    before = function()
      local lzn = require("lz.n")
      lzn.trigger_load("nvim-lspconfig")
      lzn.trigger_load("blink.cmp")
      lzn.trigger_load("snacks")
    end,
    after = function()
      local null_ls = require("null-ls")

      -- code action sources
      local code_actions = null_ls.builtins.code_actions

      -- diagnostic sources
      local diagnostics = null_ls.builtins.diagnostics

      -- formatting sources
      local formatting = null_ls.builtins.formatting

      -- custom markdown formatter
      local deno_fmt = {
        method = null_ls.methods.FORMATTING,
        filetypes = { "markdown" },
        generator = null_ls.formatter({
          command = "deno",
          args = { "fmt", "$FILENAME" },
          to_stdin = false,
          to_temp_file = true,
        }),
      }

      null_ls.register(deno_fmt)

      local ls_sources = {
        formatting.stylua,
        formatting.nixfmt,
        formatting.just,
        formatting.black,
        formatting.isort,
        formatting.clang_format,
        formatting.fish_indent,
        formatting.rustywind,
        formatting.shfmt,
        formatting.sqruff,
        formatting.tidy,
        formatting.yamlfmt,

        diagnostics.deadnix,
        diagnostics.gitlint,
        diagnostics.cppcheck,
        diagnostics.fish,
        diagnostics.pylint,
        diagnostics.sqruff,
        diagnostics.stylelint,
        diagnostics.tidy,
        diagnostics.yamllint,

        code_actions.statix,
      }

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      -- Enable null-ls
      null_ls.setup({
        -- Format on save
        on_attach = function(client, bufnr)
          if client:supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  async = false,
                  -- Filter only null-ls to receive the formatting request
                  filter = function()
                    return client.name == "null-ls"
                  end,
                })
              end,
            })
          end
        end,

        diagnostics_format = "[#{m}] #{s} (#{c})",
        debounce = 250,
        default_timeout = 5000,
        sources = ls_sources,
      })

      -- Enable lspconfig
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = true,
        virtual_lines = { current_line = true },
        underline = true,
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
