{
  config.vim.statusline.lualine = {
    enable = true;
    setupOpts = {
      tabline = {
        lualine_a = [ "buffers" ];
        lualine_z = [ "tabs" ];
      };
    };
    activeSection = {
      a = [
        /* lua */ ''
          { "mode" }
        ''
      ];
      b = [
        /* lua */ ''
          { "branch", icons_enabled = false }
        ''
      ];
      c = [
        /* lua */ ''
          {
            "diff",
            colored = false,
            color = 'comment',
            symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the diff symbols
          }
        ''
      ];
      x = [
        /* lua */ ''
          {
            "diagnostics",
            sources = {'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc'},
            symbols = {error = '󰅙 ', warn = ' ', info = ' ', hint = '󰌵 '},
            colored = true,
            update_in_insert = false,
            always_visible = false,
            diagnostics_color = {
              color_error = { fg = 'red' },
              color_warn = { fg = 'yellow' },
              color_info = { fg = 'cyan' },
            },
          }
        ''
      ];
      y = [
        /* lua */ ''
          {
            -- Lsp server name
            function()
              local buf_ft = vim.bo.filetype
              local excluded_buf_ft = { toggleterm = true, NvimTree = true, ["neo-tree"] = true, TelescopePrompt = true }

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
          }
        ''
      ];
      z = [
        /* lua */ ''
          { 'location' }
        ''
      ];
    };
  };
}
