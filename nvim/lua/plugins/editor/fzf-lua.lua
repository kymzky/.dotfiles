return {
	'ibhagwan/fzf-lua',
	opts = function()
		return {
			fzf_opts = {
				['--pointer'] = '▌',
				['--marker'] = '┃',
				['--layout'] = 'reverse-list',
				['--cycle'] = true,
			},
			fzf_colors = {
				true,
				['prompt'] = { 'fg', 'Normal' },
				['pointer'] = { 'fg', 'Normal' },
				['marker'] = { 'fg', 'Normal' },
				['gutter'] = '-1',
			},
			winopts = {
				split = 'botright new',
				preview = {
					border = 'none',
				},
			},
			buffers = {
				winopts = {
					split = 'botright vnew',
					preview = {
						hidden = true,
					},
					on_create = function()
						vim.cmd('vertical resize 100')
					end,
				},
			},
			colorschemes = {
				winopts = {
					on_create = function()
						vim.cmd('resize 5')
					end,
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
					'^onehalf[-]lush[-]dark$',
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
			files = {
				git_icons = true,
				follow = true,
				no_ignore = true,
			},
			grep = {
				winopts = {
					split = 'topleft new',
				},
				git_icons = true,
				follow = true,
				fzf_opts = {
					['--layout'] = 'reverse',
				},
			},
			lsp = {
				code_actions = {
					winopts = {
						on_create = function()
							vim.cmd('resize 20')
						end,
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
