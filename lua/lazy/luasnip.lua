return {
  { "friendly-snippets" },
  {
    "luasnip.nvim",
    event = "DeferredUIEnter",
    before = function()
      local lzn = require("lz.n")
      lzn.trigger_load("friendly-snippets")
    end,
    after = function()
      local luasnip_loaders = require("luasnip.loaders.from_vscode")
      luasnip_loaders.lazy_load()
    end,
  },
}
