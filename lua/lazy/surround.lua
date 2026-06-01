return {
	"mini.surround",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		require("mini.surround").setup()
	end,
}
