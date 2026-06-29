return {
  "nvim-ufo",
  event = "DeferredUIEnter",
  after = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
    local language_servers = vim.lsp.get_clients()
    for _, ls in ipairs(language_servers) do
      require("lspconfig")[ls].setup({ capabilities = capabilities })
    end

    require("ufo").setup({
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
      },
    })
  end,
  keys = {
    {
      "K",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      mode = "n",
      desc = "Peek Folded Lines (UFO)",
    },
  },
}
