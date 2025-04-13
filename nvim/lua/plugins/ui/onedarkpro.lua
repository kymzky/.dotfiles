return {
	'olimorris/onedarkpro.nvim',
	tag = 'v2.13.0',
	event = 'VeryLazy',
	config = function()
		require('onedarkpro').setup({
			options = {
				transparency = true,
			},
		})
		vim.cmd('colorscheme onedark')
	end,
}
