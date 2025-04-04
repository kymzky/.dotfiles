vim.diagnostic.config({
	virtual_text = true,
})

local g = vim.g
g.autoformat = true
g.mapleader = ' '
g.maplocalleader = '\\'
g.markdown_recommended_style = 0 -- fix markdown indentation settings

local opt = vim.opt
opt.autowrite = true
opt.clipboard = 'unnamedplus' -- sync with system clipboard
opt.cmdheight = 0
opt.completeopt = 'menu,menuone'
opt.confirm = true
opt.expandtab = true
opt.fillchars = {
	foldopen = '',
	foldclose = '',
	fold = ' ',
	foldsep = ' ',
	diff = '╱',
	eob = ' ',
}
opt.foldlevel = 99
opt.foldmethod = 'indent'
opt.ignorecase = true
opt.laststatus = 3 -- enable global statusline
opt.linebreak = true
opt.number = true
opt.relativenumber = true
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
opt.shiftround = true
opt.shiftwidth = 2
opt.signcolumn = 'yes'
opt.smartindent = true
opt.spelllang = { 'en' }
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 100
opt.wrap = false

require('config.colors')
require('config.statusline')
require('config.local')
