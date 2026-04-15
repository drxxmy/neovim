return {
  "bufferline.nvim",
  event = "UIEnter",
  before = function()
    local lzn = require("lz.n")
    lzn.trigger_load("nvim-web-devicons")
  end,
  after = function()
    require("bufferline").setup({
      options = {
        style_preset = require("bufferline").style_preset.minimal,
        offsets = {
          { filetype = "neo-tree", text = "File Explorer", text_align = "center", separator = true },
        },
        show_tab_indicators = false,
        hover = {
          enabled = true,
          delay = 100,
          reveal = { "close" },
        },
      },
    })
  end,
  keys = {
    {
      "<M-h>",
      function()
        require("bufferline").cycle(-1)
      end,
    },
    {
      "<M-l>",
      function()
        require("bufferline").cycle(1)
      end,
    },
    {
      "<M-,>",
      function()
        require("bufferline").move(-1)
      end,
    },
    {
      "<M-.>",
      function()
        require("bufferline").move(1)
      end,
    },
    {
      "<M-p>",
      function()
        require("bufferline").pick_buffer()
      end,
    },
  },
}
