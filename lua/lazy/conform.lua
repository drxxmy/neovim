return {
	"conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local conform = require("conform")

		conform.formatters.deno_fmt = {
			append_args = { "--unstable-component", "--prose-wrap", "preserve" },
		}

		conform.setup({
			formatters_by_ft = {
				javascript = { "deno_fmt" },
				typescript = { "deno_fmt" },
				javascriptreact = { "deno_fmt", "rustywind" },
				typescriptreact = { "deno_fmt", "rustywind" },
				css = { "deno_fmt" },
				html = { "deno_fmt", "rustywind" },
				vue = { "deno_fmt", "rustywind" },
				json = { "deno_fmt" },
				jsonc = { "deno_fmt" },
				markdown = { "deno_fmt" },
				yaml = { "deno_fmt" },
				nix = { "nixfmt" },
				just = { "just" },
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = { "isort", "black" },
				sql = { "sqruff" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
			},

			format_on_save = {
				timeout_ms = 750,
				lsp_format = "fallback",
			},
		})
	end,
}
