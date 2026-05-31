return {
	"nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		require("lint").linters_by_ft = {
			python = { "pylint" },
			nix = { "deadnix", "statix" },
			git = { "gitlint" },
			cpp = { "cppcheck", "cpplint" },
			fish = { "fish" },
			sql = { "sqruff" },
			css = { "stylelint" },
			html = { "tidy" },
			lua = { "selene" },
		}
	end,
}
