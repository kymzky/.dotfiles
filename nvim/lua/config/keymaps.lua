-- General configuration
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('n', '<Esc>', ':noh<CR>', { noremap = true })

-- Buffers
vim.keymap.set('n', '<Leader>bd', ':bdelete<CR>', { desc = 'Buffer delete', silent = true })
vim.keymap.set('n', '<Leader>bo', function()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(buffers) do
		if bufnr ~= current_buf then
			vim.api.nvim_buf_delete(bufnr, { force = false })
		end
	end
end, { desc = 'Buffer delete', silent = true })
vim.keymap.set('n', 'H', ':bprevious<CR>', { desc = 'Buffer previous', silent = true })
vim.keymap.set('n', 'L', ':bnext<CR>', { desc = 'Buffer next', silent = true })

-- CodeCompanion
vim.keymap.set({ 'n' }, '<Leader>cc', '<Cmd>CodeCompanionChat Toggle<CR>', { noremap = true, silent = true })

-- fidget
vim.keymap.set('n', '<Leader>n', '<Cmd>Fidget history<CR>', { desc = 'Show notification history' })

-- gitsigns
vim.keymap.set('n', '<Leader>h', function()
	package.loaded.gitsigns.nav_hunk('next')
end, { desc = 'Gitsigns next hunk' })
vim.keymap.set('n', '<Leader>H', function()
	package.loaded.gitsigns.nav_hunk('prev')
end, { desc = 'Gitsigns previous hunk' })
vim.keymap.set('n', '<Leader>gb', '<Cmd>Gitsigns blame<CR>', { desc = 'Gitsigns blame buffer' })
vim.keymap.set('n', '<Leader>gB', '<Cmd>Gitsigns blame_line<CR>', { desc = 'Gitsigns blame line' })

-- grug-far
vim.keymap.set('n', '<Leader>sr', function()
	local grug = require('grug-far')
	local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')
	grug.open({
		transient = true,
		prefills = {
			filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
		},
	})
end, { desc = 'grug-far search and replace' })

-- Kulala
vim.keymap.set('n', '<Leader>k', function()
	require('kulala').run()
end, { desc = 'Kuala run' })

-- Lazygit
local function open_lazygit()
	if vim.env.TMUX ~= nil then
		vim.fn.system('tmux popup -E -d "#{pane_current_path}" -h 95% -w 95% lazygit')
	else
		vim.notify('Not running in tmux session', vim.log.levels.WARN)
	end
end
vim.keymap.set('n', '<Leader>gg', open_lazygit, {
	desc = 'Open lazygit in floating tmux window',
})

-- LSP
vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, { desc = 'Code Actions' })
vim.keymap.set({ 'n', 'v' }, '<Leader>cr', vim.lsp.buf.rename, { desc = 'Code Actions' })
vim.keymap.set('n', '<Leader>d', vim.diagnostic.goto_next, { desc = 'Diagnostic go to next' })
vim.keymap.set('n', '<Leader>D', vim.diagnostic.goto_prev, { desc = 'Diagnostic go to previous' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', function()
	require('telescope.builtin').lsp_references({
		include_declaration = false,
	})
end, { desc = 'Find references' })

-- nvim-dap
vim.keymap.set('n', '<Leader>db', function()
	require('dap').toggle_breakpoint()
end, { desc = 'DAP toggle breakpoint' })
vim.keymap.set('n', '<Leader>dc', function()
	require('dap').continue()
end, { desc = 'DAP continue' })
vim.keymap.set('n', '<Leader>dC', function()
	require('dap').run_to_cursor()
end, { desc = 'DAP run to cursor' })
vim.keymap.set('n', '<Leader>di', function()
	require('dap').step_into()
end, { desc = 'DAP step into' })
vim.keymap.set('n', '<Leader>dl', function()
	require('dap').run_last()
end, { desc = 'DAP run last' })
vim.keymap.set('n', '<Leader>do', function()
	require('dap').step_out()
end, { desc = 'DAP step out' })
vim.keymap.set('n', '<Leader>dt', function()
	require('dap').terminate()
end, { desc = 'DAP terminate' })

-- nvim-dap-ui
vim.keymap.set('n', '<Leader>du', function()
	require('dapui').toggle()
end, { desc = 'Toggle DAP UI' })

-- statusline
vim.keymap.set('n', '<Leader>p', function()
	vim.b.filename_toggle = not vim.b.filename_toggle
	vim.cmd('redrawstatus')
end, { desc = 'Toggle filename/path display in statusline' })

-- Telescope
vim.keymap.set('n', '<Leader><Leader>', '<Cmd>Telescope find_files<CR>', { desc = 'Telescope find_files' })
vim.keymap.set('n', '<Leader>,', '<Cmd>Telescope buffers<CR>', { desc = 'Telescope buffers' })
vim.keymap.set('n', '<Leader>/', '<Cmd>Telescope live_grep<CR>', { desc = 'Telescope live_grep' })
vim.keymap.set(
	'n',
	'<Leader>gh',
	'<Cmd>Telescope git_bcommits<CR>',
	{ desc = 'Telescope git history for current buffer' }
)
vim.keymap.set('n', '<Leader>sc', '<Cmd>Telescope commands<CR>', { desc = 'Telescope commands' })
vim.keymap.set('n', '<Leader>sC', '<Cmd>Telescope command_history<CR>', { desc = 'Telescope command_history' })
vim.keymap.set('n', '<Leader>sd', '<Cmd>Telescope diagnostics<CR>', { desc = 'Telescope diagnostics' })
vim.keymap.set('n', '<Leader>sh', '<Cmd>Telescope help_tags<CR>', { desc = 'Telescope help_tags' })
vim.keymap.set('n', '<Leader>sk', '<Cmd>Telescope keymaps<CR>', { desc = 'Telescope keymaps' })
vim.keymap.set('n', '<Leader>sw', function()
	require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })
end, { desc = 'Telescope grep current word' })

-- Yazi
vim.keymap.set('n', '<Leader>e', '<Cmd>Yazi<CR>')
vim.keymap.set('n', '<Leader>E', '<Cmd>Yazi cwd<CR>')

-- Visual selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down', silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up', silent = true })
vim.keymap.set('v', '>', '>gv', { desc = 'move selection right', silent = true })
vim.keymap.set('v', '<', '<gv', { desc = 'move selection left', silent = true })
