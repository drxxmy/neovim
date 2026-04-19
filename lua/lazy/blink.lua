return {
  { "lspkind.nvim" },
  {
    "blink.cmp",
    event = "DeferredUIEnter",
    before = function()
      local lzn = require("lz.n")
      lzn.trigger_load("lspkind.nvim")
      lzn.trigger_load("lazydev")
      lzn.trigger_load("luasnip")
    end,
    after = function()
      require("blink.cmp").setup({
        signature = { enabled = true },
        completion = {
          menu = {
            auto_show = true,
            draw = {
              components = {
                kind_icon = {
                  text = function(ctx)
                    local icon = ctx.kind_icon
                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                      local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                      if dev_icon then
                        icon = dev_icon
                      end
                    else
                      icon = require("lspkind").symbol_map[ctx.kind] or ""
                    end
                    return icon .. ctx.icon_gap
                  end,

                  highlight = function(ctx)
                    local hl = ctx.kind_hl
                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                      local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                      if dev_icon then
                        hl = dev_hl
                      end
                    end
                    return hl
                  end,
                },
              },
              treesitter = { "lsp" },
            },
          },
          ghost_text = { enabled = true },
          list = {
            selection = {
              preselect = true,
              auto_insert = false,
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 300,
          },
        },
        keymap = {
          preset = "none",
          ["<Tab>"] = {
            function(cmp)
              if cmp.snippet_active() then
                return cmp.accept()
              else
                return cmp.select_and_accept()
              end
            end,
            "snippet_forward",
            "fallback",
          },
          ["<S-Tab>"] = { "snippet_backward", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-u>"] = { "scroll_documentation_up", "fallback" },
          ["<C-d>"] = { "scroll_documentation_down", "fallback" },
          ["<C-e>"] = { "hide", "fallback" },
          ["<C-h>"] = { "show", "show_documentation", "hide_documentation" },
          ["<CR>"] = { "accept", "fallback" },
        },
        cmdline = {
          keymap = {
            preset = "none",
            ["<Tab>"] = { "select_and_accept", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-h>"] = { "hide" },
            ["<CR>"] = { "fallback" },
          },
        },
        sources = {
          default = { "lazydev", "lsp", "buffer", "snippets", "path" },
          providers = {
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              score_offset = 100,
            },
          },
        },
        fuzzy = { implementation = "rust" },
      })
    end,
  },
}
