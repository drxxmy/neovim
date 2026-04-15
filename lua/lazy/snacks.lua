return {
  "snacks.nvim",
  event = "VimEnter",
  after = function()
    require("snacks").setup({
      dashboard = {
        enabled = true,
        sections = {
          { icon = " ", title = "recent files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "projects", section = "projects", indent = 2, padding = 1 },
          { icon = " ", title = "keymaps", section = "keys", indent = 2, padding = 1 },
        },
      },
      indent = { enabled = true },
      image = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      quickfile = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true, minimal = true, backdrop = { transparent = false } },
    })
  end,
  keys = {
    -- Buffers
    {
      "<A-c>",
      function()
        require("snacks").bufdelete.delete()
      end,
    },
    -- Git
    {
      "<leader>gb",
      function()
        require("snacks").git.blame_line()
      end,
    },
    {
      "<leader>gg",
      function()
        require("snacks").lazygit.open()
      end,
    },
    {
      "<leader>gl",
      function()
        require("snacks").lazygit.log()
      end,
    },
    -- Words
    {
      "]]",
      function()
        require("snacks").words.jump(vim.v.count1)
      end,
    },
    {
      "[[",
      function()
        require("snacks").words.jump(-vim.v.count1)
      end,
    },
    -- Terminal
    {
      "<leader>t",
      function()
        require("snacks").terminal()
      end,
    },
    -- Zen
    {
      "<leader>z",
      function()
        require("snacks").zen.zen()
      end,
    },
    {
      "<leader>m",
      function()
        require("snacks").zen.zoom()
      end,
    },
  },
}
