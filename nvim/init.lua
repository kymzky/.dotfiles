require('config.options')

local lazy_version = 'v11.17.1'
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=' .. lazy_version, lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out, 'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
else
	local out = vim.fn.system({ 'git', '-C', lazypath, 'checkout', lazy_version })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to checkout branch 'asdasd' in lazy.nvim:\n", 'ErrorMsg' },
			{ out, 'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.lazyvim_check_order = false
require('lazy').setup({
	spec = {
		{ import = 'plugins/editor' },
		{ import = 'plugins/ide/mason' },
		{ import = 'plugins/ide' },
		{ import = 'plugins/ui/themes' },
		{ import = 'plugins/ui' },
		{ import = 'plugins/util' },
	},
	change_detection = {
		notify = false,
	},
})

require('config.keymaps')
require('config.autocmds')
