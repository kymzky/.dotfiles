return {
	'williamboman/mason.nvim',
	tag = 'v2.0.0',
	event = 'VeryLazy',
	config = function()
		require('mason').setup()
	end,
}
