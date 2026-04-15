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
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").live_grep()
      end,
    },
  },
}
