return {
  "snacks.nvim",
  event = "VimEnter",
  after = function()
    require("snacks").setup({
      dashboard = {
        enabled = true,
        preset = {
          header = "猿も木から落ちる",
          keys = {
            {
              icon = " ",
              key = "f",
              desc = "find file",
              action = ":lua Snacks.dashboard.pick('files')",
            },
            {
              icon = " ",
              key = "s",
              desc = "find text",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
              icon = " ",
              key = "r",
              desc = "recent files",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            { icon = " ", key = "q", desc = "quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          {
            icon = " ",
            title = "recent files",
            section = "recent_files",
            limit = 4,
            cwd = true,
            indent = 2,
            padding = 1,
          },
          {
            icon = " ",
            title = "projects",
            section = "projects",
            limit = 3,
            indent = 2,
            padding = 1,
          },
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
      desc = "Delete buffer",
    },
    -- Git
    {
      "<leader>gb",
      function()
        require("snacks").git.blame_line()
      end,
      desc = "Git Blame",
    },
    {
      "<leader>gg",
      function()
        require("snacks").lazygit.open()
      end,
      desc = "Toggle Lazygit",
    },
    {
      "<leader>gl",
      function()
        require("snacks").lazygit.log()
      end,
      desc = "Toggle Lazygit Log",
    },
    -- Words
    {
      "]]",
      function()
        require("snacks").words.jump(vim.v.count1)
      end,
      desc = "Jump to the next word occurance",
    },
    {
      "[[",
      function()
        require("snacks").words.jump(-vim.v.count1)
      end,
      desc = "Jump to the previous word occurance",
    },
    -- Terminal
    {
      "<leader>t",
      function()
        require("snacks").terminal()
      end,
      desc = "Open Terminal buffer",
    },
    -- Zen
    {
      "<leader>z",
      function()
        require("snacks").zen.zen()
      end,
      desc = "Toggle Zen mode",
    },
    {
      "<leader>bm",
      function()
        require("snacks").zen.zoom()
      end,
      desc = "Zoom current buffer",
    },
  },
}
