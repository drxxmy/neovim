return {
  "telescope.nvim",
  cmd = "Telescope",

  after = function()
    local telescope = require("telescope")
    telescope.setup({})
    telescope.load_extension("manix")
    telescope.load_extension("fzf")
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Files (Telescope)",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers (Telescope)",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live Grep (Telescope)",
    },
    {
      "<leader>fm",
      function()
        require("telescope-manix").search()
      end,
      desc = "Manix (Telescope)",
    },
  },
}
