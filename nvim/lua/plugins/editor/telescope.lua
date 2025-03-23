return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	event = 'VeryLazy',
	config = function()
		local actions = require('telescope.actions')
		require('telescope').setup({
			defaults = {
				layout_strategy = 'vertical',
				layout_config = {
					vertical = {
						preview_height = 0.65,
						prompt_position = 'top',
						mirror = true,
					},
				},
				mappings = {
					i = {
						['jk'] = actions.close,
					},
				},
			},
		})
	end,
}
