local M = {}

M.colors = {
	bg = '#0A3D00',
	fg = '#FBD332',
	lightred = '#F53838',

	cyan = '#00FFFF',
	blue = '#4FA9FF',
	lightgray = '#B0B0B0',

	red = '#9E2011',
	green = '#07E300',
	white = '#FFFFFF',
	yellow = '#FFFF00',
	magenta = '#d786ff',
	gray = '#888888',
	darkgray = '#444444',
}

local function highlight(group, props)
	local gui = props.gui and 'gui=' .. props.gui or 'gui=NONE'
	local guifg = props.fg and 'guifg=' .. props.fg or 'guifg=NONE'
	local guibg = props.bg and 'guibg=' .. props.bg or 'guibg=NONE'
	local guisp = props.sp and 'guisp=' .. props.sp or ''
	vim.cmd(string.format('highlight %s %s %s %s %s', group, gui, guifg, guibg, guisp))
end

function M.setup()
	vim.opt.background = 'dark'

	-- UI
	highlight('Normal', { fg = M.colors.fg, bg = M.colors.bg })
	highlight('CursorLine', { bg = M.colors.darkgray })
	highlight('Visual', { bg = M.colors.yellow })
	highlight('LineNr', { fg = M.colors.gray })
	highlight('CursorLineNr', { fg = M.colors.yellow, gui = 'bold' })
	highlight('StatusLine', { fg = M.colors.bg, bg = M.colors.bg })
	highlight('Pmenu', { fg = M.colors.fg, bg = M.colors.darkgray })
	highlight('PmenuSel', { fg = M.colors.bg, bg = M.colors.yellow })

	-- Syntax
	highlight('Comment', { fg = M.colors.white, gui = 'italic' })
	highlight('String', { fg = M.colors.lightred })
	highlight('Keyword', { fg = M.colors.lightgray, gui = 'bold' })
	highlight('Function', { fg = M.colors.blue })
	highlight('Identifier', { fg = M.colors.fg })
	highlight('Constant', { fg = M.colors.magenta })
	highlight('Type', { fg = M.colors.blue })
	highlight('Statement', { fg = M.colors.lightgray })
	highlight('Operator', { fg = M.colors.lightgray })
	highlight('Number', { fg = M.colors.magenta })
	highlight('Boolean', { fg = M.colors.magenta })
	highlight('Error', { fg = M.colors.red, bg = M.colors.bg, gui = 'bold' })
	highlight('Todo', { fg = M.colors.bg, bg = M.colors.yellow, gui = 'bold' })
	highlight('Underlined', { fg = M.colors.red, gui = 'underline' })

	-- Treesitter (nur ein paar Beispiele)
	highlight('@function', { fg = M.colors.blue })
	highlight('@variable', { fg = M.colors.fg })
	highlight('@comment', { fg = M.colors.white, gui = 'italic' })
	highlight('@string', { fg = M.colors.lightred })
	highlight('@keyword', { fg = M.colors.lightgray })
	highlight('@type', { fg = M.colors.blue })
	highlight('@constant', { fg = M.colors.magenta })

	-- LSP Diagnostics
	highlight('DiagnosticError', { fg = M.colors.red })
	highlight('DiagnosticWarn', { fg = M.colors.yellow })
	highlight('DiagnosticInfo', { fg = M.colors.white })
	highlight('DiagnosticHint', { fg = M.colors.blue })
end

return M
