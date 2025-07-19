return {
	'olimorris/codecompanion.nvim',
	tag = 'v17.9.0',
	event = 'VeryLazy',
	config = true,
	opts = {
		strategies = {
			chat = {
				adapter = 'openai',
			},
		},
	},
}
