return {
	'ibhagwan/fzf-lua',
	opts = function()
		return {
			fzf_opts = {
				['--pointer'] = '▌',
				['--marker'] = '┃',
				['--layout'] = 'reverse-list',
			},
			fzf_colors = {
				true,
				['prompt'] = { 'fg', 'Normal' },
				['pointer'] = { 'fg', 'Normal' },
				['marker'] = { 'fg', 'Normal' },
				['gutter'] = '-1',
			},
			winopts = {
				preview = {
					title = false,
				},
			},
			buffers = {
				winopts = {
					title = false,
				},
			},
			colorschemes = {
				winopts = {
					title = false,
				},
				ignore_patterns = {
					'^blue$',
					'^cyberdream[-]light$',
					'^darkblue$',
					'^default$',
					'^delek$',
					'^desert$',
					'^elflord$',
					'^evening$',
					'^habamax$',
					'^industry$',
					'^koehler$',
					'^lunaperche$',
					'^morning$',
					'^murphy$',
					'^onedark_dark$',
					'^onedark_light$',
					'^onedark_vivid$',
					'^onelight$',
					'^pablo$',
					'^peachpuff$',
					'^quiet$',
					'^retrobox$',
					'^ron$',
					'^shine$',
					'^slate$',
					'^sorbet$',
					'^torte$',
					'^unokai$',
					'^vaporwave$',
					'^vim$',
					'^wildcharm$',
					'^zaibatsu$',
					'^zellner$',
				},
			},
			command_history = {
				winopts = {
					title = false,
				},
			},
			commands = {
				winopts = {
					title = false,
				},
			},
			diagnostics = {
				winopts = {
					title = false,
				},
			},
			files = {
				winopts = {
					title = false,
				},
				git_icons = true,
				follow = true,
				no_ignore = true,
			},
			git = {
				bcommits = {
					winopts = {
						title = false,
					},
				},
			},
			grep = {
				winopts = {
					title = false,
				},
				git_icons = true,
				follow = true,
			},
			keymaps = {
				winopts = {
					title = false,
				},
			},
			lsp = {
				code_actions = {
					winopts = {
						title = false,
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local fzf_lua = require('fzf-lua')
		fzf_lua.setup(opts)
		fzf_lua.register_ui_select()
	end,
}
