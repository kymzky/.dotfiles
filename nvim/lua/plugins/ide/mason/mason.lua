return {
	'williamboman/mason.nvim',
	tag = 'v1.11.0',
	event = 'VeryLazy',
	config = function()
		require('mason').setup()
	end,
}
