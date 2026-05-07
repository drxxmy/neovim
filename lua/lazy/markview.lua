return {
  "markview.nvim",
  ft = "markdown",
  before = function()
    local lzn = require("lz.n")
    lzn.trigger_load("nvim-web-devicons")
  end,
  after = function()
    require("markview").setup({
      preview = {
        icon_provider = "devicons",
      },
    })
  end,
  keys = {
    {
      "<leader>m",
      function()
        require("markview.commands").toggle()
      end,
      desc = "Toggle Markview",
    },
  },
}
