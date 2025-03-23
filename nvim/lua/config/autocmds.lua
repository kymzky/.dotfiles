local api = vim.api
local function augroup(name)
	return api.nvim_create_augroup(name, { clear = true })
end

api.nvim_create_autocmd({ 'BufEnter' }, {
	group = augroup('ansible'),
	pattern = {
		'*/playbooks/*.yml',
		'*/playbooks/*.yaml',
		'*/roles/*/tasks/*.yml',
		'*/roles/*/tasks/*.yaml',
		'*/roles/*/handlers/*.yml',
		'*/roles/*/handlers/*.yaml',
	},
	callback = function()
		vim.opt_local.filetype = 'yaml.ansible'
	end,
})

api.nvim_create_autocmd({ 'BufEnter' }, {
	group = augroup('dart'),
	pattern = '*.dart',
	once = true,
	callback = function()
		require('lspconfig').dartls.setup({})
		vim.api.nvim_buf_set_option(0, 'commentstring', '// %s')
	end,
})

api.nvim_create_autocmd('BufEnter', {
	group = augroup('helm'),
	pattern = { '*.yaml', '*.yml' },
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local path = vim.fn.expand('%:p')
		local chart_path = vim.fn.fnamemodify(path, ':p:h') .. '/Chart.yaml'
		if vim.fn.filereadable(chart_path) == 1 then
			vim.bo[bufnr].filetype = 'helm'
		end
	end,
})

api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
	group = augroup('lint'),
	callback = function()
		require('lint').try_lint()
	end,
})

api.nvim_create_autocmd('FileType', {
	group = augroup('spell_check'),
	pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
