return {
	"nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		require("nvim-surround").setup()
	end,
}
