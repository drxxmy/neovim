return {
	"flash.nvim",
	after = function()
		require("flash").setup({})
	end,
	keys = {
		{
			"s",
			function()
				require("flash").jump()
			end,
			desc = "Jump (Flash)",
		},
		{
			"S",
			function()
				require("flash").treesitter()
			end,
			desc = "Treesitter (Flash)",
		},
	},
}
