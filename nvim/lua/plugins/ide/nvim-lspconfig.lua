local lsp_config = require("config.lsp")
return {
	"neovim/nvim-lspconfig",
	tag = "v2.5.0",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		servers = {
			dartls = {},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		lsp_config.servers.manual_config(lspconfig)
		for _, server in ipairs(lsp_config.servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end
	end,
}
