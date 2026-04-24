return {
  "gitsigns.nvim",
  event = "BufReadPre",
  after = function()
    require("gitsigns")
  end,
}
