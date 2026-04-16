return {
  "render-markdown.nvim",
  ft = "markdown",
  before = function()
    local lzn = require("lz.n")
    lzn.trigger_load("nvim-web-devicons")
  end,
  after = function()
    require("render-markdown").setup()
  end,
  keys = {
    {
      "<leader>m",
      function()
        require("render-markdown").buf_toggle()
      end,
    },
  },
}
