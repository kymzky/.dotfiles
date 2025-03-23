return {
	'olimorris/codecompanion.nvim',
	tag = 'v14.2.2',
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
