local map = vim.keymap.set

-- Splits
map("n", "<leader>-", "<cmd>horizontal split<cr>", { desc = "Open horizontal split" })
map("n", "<leader>|", "<cmd>vertical split<cr>", { desc = "Open vertical split" })

-- Terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal mode" })
