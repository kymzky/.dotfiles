local api = vim.api

api.nvim_set_hl(0, 'FilenameNormal', { fg = '#FFFFFF' })
api.nvim_set_hl(0, 'FilenameModified', { fg = '#FFD833' })
api.nvim_set_hl(0, 'GitBranch', {
	bg = '#ffffff',
	fg = '#000000',
})
api.nvim_set_hl(0, 'GitSignsAddLine', { fg = '#00875F' })
api.nvim_set_hl(0, 'GitSignsChangeLine', { fg = '#87875F' })
api.nvim_set_hl(0, 'GitSignsDeleteLine', { fg = '#875F5F' })
