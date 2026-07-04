-- Open help pages in a new buffer instead of hsplit
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function(event)
    if vim.bo[event.buf].filetype == "help" then
      vim.cmd.only()
      vim.bo[event.buf].buflisted = true
    end
  end,
})

-- Clear builtin snippet highlights
vim.api.nvim_create_autocmd("InsertEnter", {
  desc = "Clear builtin snippet highlights",
  callback = function()
    if vim.snippet then
      vim.api.nvim_set_hl(0, "SnippetTabstop", {})
      vim.api.nvim_set_hl(0, "SnippetTabstopActive", {})
    end
  end,
})
