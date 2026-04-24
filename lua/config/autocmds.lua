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
