local lsp_config = require("config.lsp")
return {
	"stevearc/conform.nvim",
	tag = "v9.1.0",
	event = "VeryLazy",
	config = function()
		require("conform").setup({
			formatters_by_ft = lsp_config.formatters_by_ft,
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}
