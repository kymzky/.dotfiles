local lsp_config = require("config.lsp")
return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		require("lint").linters_by_ft = lsp_config.linters_by_ft
	end,
}
