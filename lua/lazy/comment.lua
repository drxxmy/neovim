return {
  "Comment.nvim",
  event = "BufReadPost",
  after = function()
    require("Comment").setup()
  end,
}
