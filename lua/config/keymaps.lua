local map = vim.keymap.set

-- Buffers
map("n", "<leader>br", "<cmd>bufdo e<cr>", { desc = "Reload buffer" })
map("n", "<leader>bd", function()
  local bufnr = 0
  vim.diagnostic.enable(not vim.diagnostic.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
end, { desc = "Toggle buffer diagnostics" })

-- Splits
map("n", "<leader>-", "<cmd>horizontal split<cr>", { desc = "Open horizontal split" })
map("n", "<leader>|", "<cmd>vertical split<cr>", { desc = "Open vertical split" })

-- Terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal mode" })
