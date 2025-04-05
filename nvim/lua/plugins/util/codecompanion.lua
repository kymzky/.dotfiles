return {
	'olimorris/codecompanion.nvim',
	tag = 'v14.6.1',
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
