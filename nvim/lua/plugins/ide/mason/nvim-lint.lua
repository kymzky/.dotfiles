return {
	'rshkarin/mason-nvim-lint',
	tag = 'v0.1.1',
	event = 'VeryLazy',
	config = function()
		require('mason-nvim-lint').setup()
	end,
}
