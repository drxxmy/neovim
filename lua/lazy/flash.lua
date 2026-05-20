return {
  "flash.nvim",
  keys = {
    {
      "s",
      function()
        require("flash").jump()
      end,
      mode = { "n", "v" },
      desc = "Jump (Flash)",
    },
    {
      "S",
      function()
        require("flash").treesitter()
      end,
      mode = { "n", "v" },
      desc = "Treesitter (Flash)",
    },
  },
}
