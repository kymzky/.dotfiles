return {
	'ibhagwan/fzf-lua',
	opts = {
		files = {
			git_icons = true,
			follow = true,
			no_ignore = true,
		},
	},
	config = function(_, opts)
		local fzf_lua = require('fzf-lua')
		fzf_lua.setup(opts)
		fzf_lua.register_ui_select()
	end,
}
