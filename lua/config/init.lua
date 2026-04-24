vim.g.mapleader = " "
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })

require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.treesitter")
