return {
  "colorful-winsep.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("colorful-winsep").setup()
  end,
}
