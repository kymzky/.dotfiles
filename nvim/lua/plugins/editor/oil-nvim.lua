return {
	'stevearc/oil.nvim',
	tag = 'v2.15.0',
	opts = {
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			['<CR>'] = function()
				local oil = require('oil')
				local actions = require('oil.actions')
				local entry = oil.get_cursor_entry()
				vim.notify(entry.type)
				if entry and entry.type == 'file' then
					local path = oil.get_current_dir() .. entry.name
					vim.cmd('bdelete')
					vim.cmd('edit ' .. vim.fn.fnameescape(path))
				else
					actions.select.callback()
				end
			end,
		},
	},
}
