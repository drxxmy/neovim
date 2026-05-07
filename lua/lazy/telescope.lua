return {
  "telescope.nvim",
  cmd = "Telescope",

  after = function()
    require("telescope").setup()
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
  },
}
