local map = vim.keymap.set

-- Splits
map("n", "<leader>-", "<cmd>horizontal split<cr>", { desc = "Open horizontal split" })
map("n", "<leader>|", "<cmd>vertical split<cr>", { desc = "Open vertical split" })
-- Buffers
-- map("n", "<M-h>", "<cmd>bprev<cr>")
-- map("n", "<M-l>", "<cmd>bnext<cr>")
