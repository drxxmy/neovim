return {
  "lualine.nvim",
  event = "DeferredUIEnter",
  before = function()
    local lzn = require("lz.n")
    lzn.trigger_load("nvim-web-devicons")
  end,
  after = function()
    local snacks = require("snacks")

    local function get_statusline()
      local filetype = vim.bo.filetype
      local title = filetype
      local meta = ""

      if filetype == "snacks_terminal" then
        title = "TERMINAL"
        meta = vim.fn.expand("%:t"):match(".*:(%S+)$") or vim.fn.expand("%:t")
      elseif filetype == "snacks_picker_list" then
        title = "EXPLORER"
        local picker = snacks.picker.get()[1]
        if picker then
          meta = vim.fn.fnamemodify(picker:dir(), ":~")
        else
          meta = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
        end
      elseif filetype == "snacks_picker_input" then
        title = "PICKER"
        local picker = snacks.picker.get()[1]
        if picker then
          local input = picker.input and picker.input:get() or ""
          local count = #picker:items()
          meta = input ~= "" and (" " .. input .. ": " .. count .. " results") or (count .. " results")
        else
          meta = ""
        end
      end

      return title, meta
    end

    local lualine_snacks = {
      sections = {
        lualine_a = {
          function()
            local title, _ = get_statusline()
            return title
          end,
        },
        lualine_b = {
          function()
            local _, meta = get_statusline()
            return meta
          end,
        },
      },
      filetypes = {
        "snacks_picker_input",
        "snacks_picker_list",
        "snacks_terminal",
      },
    }

    require("lualine").setup({
      extensions = { lualine_snacks },
      options = {
        globalstatus = true,
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
            local excluded_buf_ft = { toggleterm = true, TelescopePrompt = true }

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
