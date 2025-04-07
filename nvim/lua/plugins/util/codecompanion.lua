return {
	'olimorris/codecompanion.nvim',
	tag = 'v14.8.0',
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
