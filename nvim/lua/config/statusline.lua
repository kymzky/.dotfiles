Statusline = {}

local function git_branch()
	local branch = vim.b.gitsigns_head or ''
	if branch == '' then
		return ''
	end
	return string.format('%%#GitBranch# %s ', branch)
end

local function filename()
	local fname = vim.fn.expand('%:t')
	if fname == '' then
		return ''
	end
	local path = vim.bo.modified and string.format('%%#FilenameModified#%s* ', fname)
		or string.format('%%#FilenameNormal#%s ', fname)

	if not vim.b.filename_toggle then
		vim.b.filename_toggle = false
	end

	if vim.b.filename_toggle then
		return string.format('%%#FilenamePath#%s ', vim.fn.expand('%:~:.'))
	else
		return path
	end
end

local function lsp()
	local count = {}
	local levels = {
		errors = 'Error',
		warnings = 'Warn',
		info = 'Info',
		hints = 'Hint',
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ''
	local warnings = ''
	local hints = ''
	local info = ''

	if count['errors'] ~= 0 then
		errors = ' %#LspDiagnosticsSignError# ' .. count['errors']
	end
	if count['warnings'] ~= 0 then
		warnings = ' %#LspDiagnosticsSignWarning# ' .. count['warnings']
	end
	if count['hints'] ~= 0 then
		hints = ' %#LspDiagnosticsSignHint# ' .. count['hints']
	end
	if count['info'] ~= 0 then
		info = ' %#LspDiagnosticsSignInformation# ' .. count['info']
	end

	return errors .. warnings .. hints .. info .. '%#Normal#'
end

local function git_status()
	local status = vim.b.gitsigns_status_dict
	if not status then
		return ''
	end

	local added = status.added or 0
	local changed = status.changed or 0
	local removed = status.removed or 0

	local git_indicators = {}
	if added > 0 then
		table.insert(git_indicators, '%#GitSignsAddLine#' .. string.format('  %d', added) .. '%#Normal#')
	end
	if changed > 0 then
		table.insert(git_indicators, '%#GitSignsChangeLine#' .. string.format('  %d', changed) .. '%#Normal#')
	end
	if removed > 0 then
		table.insert(git_indicators, '%#GitSignsDeleteLine#' .. string.format('  %d', removed) .. '%#Normal#')
	end

	if #git_indicators == 0 then
		return ''
	end

	return string.format(' %s ', table.concat(git_indicators, ' '))
end

local function position()
	local line = vim.fn.line('.')
	local col = vim.fn.col('.')
	local total_lines = vim.fn.line('$')
	local percentage = math.floor((line / total_lines) * 100)
	return string.format(' %%#Normal# %d,%d%%  %d%%%% ', line, col, percentage)
end

Statusline = function()
	vim.api.nvim_create_autocmd('FileType', {
		pattern = '*',
		once = true,
		callback = function()
			vim.cmd([[redrawstatus]])
		end,
	})

	return table.concat({
		git_branch(),
		'%#Statusline#',
		'%#Normal# ',
		filename(),
		lsp(),
		'%=',
		git_status(),
		position(),
	})
end

vim.opt.statusline = '%!v:lua.Statusline()'
