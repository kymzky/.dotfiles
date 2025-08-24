local api = vim.api
local statefile = vim.fn.stdpath('state') .. '/colorscheme'
local default_colorscheme = 'onedark'

api.nvim_create_autocmd('ColorScheme', {
	group = api.nvim_create_augroup('colorscheme', { clear = true }),
	callback = function()
		local name = vim.g.colors_name or default_colorscheme
		vim.fn.writefile({ name }, statefile)
	end,
})

local ok, lines = pcall(vim.fn.readfile, statefile)
local colorscheme = (ok and lines and lines[1]) or default_colorscheme
vim.cmd.colorscheme(colorscheme)
