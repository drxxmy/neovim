return {
  "neo-tree.nvim",
  before = function()
    local lzn = require("lz.n")
    lzn.trigger_load("snacks")
  end,
  after = function()
    local events = require("neo-tree.events")

    local function on_move(data)
      require("snacks").rename.on_rename_file(data.source, data.destination)
    end

    require("neo-tree").setup({
      enable_cursor_hijack = true,
      git_status_async = true,

      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_by_name = {
            "__pycache__",
            ".direnv",
            ".devenv",
            "node_modules",
            ".vscode",
            ".vite",
          },
          never_show = {
            "__pycache__",
          },
        },
      },

      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          handler = function(args)
            -- map <esc> to enter normal mode (by default closes prompt)
            vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
        {
          event = events.FILE_MOVED,
          handler = on_move,
        },
        {
          event = events.FILE_RENAMED,
          handler = on_move,
        },
      },
    })
  end,
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree toggle<cr>",
    },
  },
}
