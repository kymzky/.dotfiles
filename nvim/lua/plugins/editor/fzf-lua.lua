return {
	'ibhagwan/fzf-lua',
	opts = function()
		local actions = require('fzf-lua').actions
		return {
			files = {
				git_icons = true,
				follow = true,
				no_ignore = true,
			},
			git = {
				status = {
					actions = {
						['right'] = false,
						['left'] = false,
						['ctrl-s'] = { fn = actions.git_stage_unstage, reload = true },
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
