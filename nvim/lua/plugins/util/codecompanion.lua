return {
	'olimorris/codecompanion.nvim',
	tag = 'v17.12.0',
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
