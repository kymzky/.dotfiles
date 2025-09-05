return {
	"williamboman/mason.nvim",
	tag = "v2.0.1",
	event = "VeryLazy",
	config = function()
		require("mason").setup()
	end,
}
