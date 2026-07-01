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
      gitbrowse = {
        url_patterns = {
          ["codeberg%.org"] = {
            branch = "/src/branch/{branch}",
            file = "/src/branch/{branch}/{file}#L{line_start}-L{line_end}",
            permalink = "/src/commit/{commit}/{file}#L{line_start}-L{line_end}",
            commit = "/commit/{commit}",
          },
        },
      },
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
      "<leader>fw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>fm",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
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
      "<leader>sD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "gai",
      function()
        Snacks.picker.lsp_incoming_calls()
      end,
      desc = "C[a]lls Incoming",
    },
    {
      "gao",
      function()
        Snacks.picker.lsp_outgoing_calls()
      end,
      desc = "C[a]lls Outgoing",
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
      "<leader>gB",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame",
    },
    {
      "<leader>gb",
      function()
        Snacks.gitbrowse.open()
      end,
      desc = "Git Browse",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit.open()
      end,
      desc = "Toggle Lazygit",
    },
    -- GitHub
    {
      "<leader>gi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "GitHub Issues (Open)",
    },
    {
      "<leader>gI",
      function()
        Snacks.picker.gh_issue({ state = "all" })
      end,
      desc = "GitHub Issues (All)",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "GitHub Pull Requests (Open)",
    },
    {
      "<leader>gP",
      function()
        Snacks.picker.gh_pr({ state = "all" })
      end,
      desc = "GitHub Pull Requests (All)",
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
