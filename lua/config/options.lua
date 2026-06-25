-- General
vim.opt.scrolloff = 8
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

-- Allow project-local configuration
vim.opt.exrc = true

-- Tab
vim.opt.tabstop = 2 -- width of a tab character
vim.opt.shiftwidth = 2 -- number of spaces for indentation
vim.opt.softtabstop = 2 -- number of spaces in tab when editing
vim.opt.expandtab = true -- convert tabs into spaces
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- UI
vim.opt.number = true -- add numbers to each line on the left side
vim.opt.relativenumber = true -- use relative numbers
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- new horizontal split goes below
vim.opt.splitright = true -- new vertical split goes right
vim.opt.fillchars:append({ eob = " " }) -- hide EOB symbols
vim.opt.signcolumn = "yes" -- always show a sign column

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable intro message
vim.opt.shortmess:append("sI")

-- Go to previous/next line with h,l,left arrow and right arrow when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- Set langmap for Russian and English keyboard layouts
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,"
  .. "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
