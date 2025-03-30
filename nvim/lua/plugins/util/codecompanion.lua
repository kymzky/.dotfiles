return {
	'olimorris/codecompanion.nvim',
	tag = 'v14.5.0',
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
