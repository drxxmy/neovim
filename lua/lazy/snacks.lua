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
              action = function()
                Snacks.dashboard.pick("files")
              end,
            },
            {
              icon = " ",
              key = "s",
              desc = "find text",
              action = function()
                Snacks.dashboard.pick("live_grep")
              end,
            },
            {
              icon = " ",
              key = "r",
              desc = "recent files",
              action = function()
                Snacks.dashboard.pick("oldfiles")
              end,
            },
            {
              icon = " ",
              key = "b",
              desc = "browse repo",
              action = function()
                Snacks.gitbrowse()
              end,
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
            filter = function(file)
              if file:match("/.git/") then
                return false
              end
              return true
            end,
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
      picker = {
        enabled = true,
        previewers = {
          git = { builtin = false },
        },
        win = {
          input = {
            keys = {
              ["<S-k>"] = { "preview_scroll_up", mode = { "n" } },
              ["<S-j>"] = { "preview_scroll_down", mode = { "n" } },
            },
          },
        },
      },
      quickfile = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true, minimal = true, backdrop = { transparent = false } },
    })
  end,
  keys = {
    -- Picker
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.grep()
      end,
      desc = "Live Grep",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>n",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
    -- Buffers
    {
      "<A-c>",
      function()
        Snacks.bufdelete.delete()
      end,
      mode = { "n", "v", "t" },
      desc = "Delete buffer",
    },
    -- Git
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit.open()
      end,
      desc = "Toggle Lazygit",
    },
    -- Words
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Jump to the next word occurance",
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Jump to the previous word occurance",
    },
    -- Terminal
    {
      "<leader>t",
      function()
        Snacks.terminal()
      end,
      desc = "Open Terminal buffer",
    },
    -- Zen
    {
      "<leader>z",
      function()
        Snacks.zen.zen()
      end,
      desc = "Toggle Zen mode",
    },
    {
      "<leader>bm",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Zoom current buffer",
    },
  },
}
