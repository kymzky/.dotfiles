return {
	'lewis6991/gitsigns.nvim',
	tag = 'v1.0.2',
	event = 'BufReadPost',
	opts = {
		signs = {
			add = { text = ' ▎' },
			change = { text = ' ▎' },
			delete = { text = ' ' },
			topdelete = { text = ' ' },
			changedelete = { text = ' ▎' },
			untracked = { text = ' ▎' },
		},
		signs_staged = {
			add = { text = ' ▎' },
			change = { text = ' ▎' },
			delete = { text = ' ' },
			topdelete = { text = ' ' },
			changedelete = { text = ' ▎' },
		},
	},
}
