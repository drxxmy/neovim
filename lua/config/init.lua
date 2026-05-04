vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, " ", "<Nop>", { silent = true, remap = false })

require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.treesitter")
