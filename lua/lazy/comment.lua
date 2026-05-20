return {
  "comment.nvim",
  event = "BufReadPost",
  after = function()
    require("Comment").setup()
  end,
}
