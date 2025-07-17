return {
	'olimorris/onedarkpro.nvim',
	tag = 'v2.18.1',
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
