return {
	"zapling/mason-conform.nvim",
	event = "VeryLazy",
	config = function()
		require("mason-conform").setup()
	end,
}
