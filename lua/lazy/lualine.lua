return {
  "lualine.nvim",
  event = "DeferredUIEnter",
  before = function()
    local lzn = require("lz.n")
    lzn.trigger_load("nvim-web-devicons")
  end,
  after = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        component_separators = { "", "" },
        section_separators = { "", "" },
        disabled_filetypes = {
          statusline = { "snacks_dashboard" },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          { icons_enabled = false },
        },
        lualine_c = {
          "diff",
          {
            colored = false,
            symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the diff symbols
          },
        },
        lualine_x = {
          "diagnostics",
          {
            sources = { "nvim_lsp", "nvim_diagnostic", "nvim_diagnostic", "vim_lsp", "coc" },
            symbols = { error = "󰅙 ", warn = " ", info = " ", hint = "󰌵 " },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
        },
        lualine_y = {
          function()
            local buf_ft = vim.bo.filetype
            local excluded_buf_ft =
            { toggleterm = true, NvimTree = true, ["neo-tree"] = true, TelescopePrompt = true }

            if excluded_buf_ft[buf_ft] then
              return ""
            end

            local bufnr = vim.api.nvim_get_current_buf()
            local clients = vim.lsp.get_clients({ bufnr = bufnr })

            if vim.tbl_isempty(clients) then
              return "No Active LSP"
            end

            local active_clients = {}
            for _, client in ipairs(clients) do
              table.insert(active_clients, client.name)
            end

            return table.concat(active_clients, ", ")
          end,
        },
        lualine_z = { "location" },
      },
    })
  end,
}
