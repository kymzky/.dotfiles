local lsp_config = require('config.lsp')
return {
	'williamboman/mason-lspconfig.nvim',
	tag = 'v2.0.0',
	event = 'BufReadPre',
	config = function()
		require('mason-lspconfig').setup({
			automatic_installation = true,
			ensure_installed = lsp_config.servers,
		})
	end,
}
