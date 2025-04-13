return {
	'olimorris/codecompanion.nvim',
	tag = 'v14.9.1',
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
