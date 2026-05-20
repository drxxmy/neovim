return {
  "hlargs.nvim",
  event = "BufReadPre",
  after = function()
    require("hlargs").setup()
  end,
}
