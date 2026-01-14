return {
	"williamboman/mason.nvim",
	tag = "v2.2.1",
	event = "VeryLazy",
	config = function()
		require("mason").setup()
	end,
}
