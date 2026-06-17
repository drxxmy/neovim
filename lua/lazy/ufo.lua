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

    require("ufo").setup()
  end,
  keys = {
    {
      "z",
      "za",
      mode = "n",
      desc = "Fold (UFO)",
    },
  },
}
