Statusline = {}
local timer_running = false

local function file()
	return "%f%{&modified?'*':''}"
end

local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = " %#DiagnosticError# " .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = " %#DiagnosticWarn# " .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = " %#DiagnosticHint# " .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = " %#DiagnosticInfo# " .. count["info"]
	end

	return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function position()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	local total_lines = vim.fn.line("$")
	local percentage = math.floor((line / total_lines) * 100)
	return string.format("%d,%d%%  - %d%%%%", line, col, percentage)
end

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		if timer_running then
			return
		end
		timer_running = true
		vim.defer_fn(function()
			vim.cmd("redrawstatus")
			timer_running = false
		end, 100)
	end,
})

Statusline = function()
	return table.concat({
		"  ",
		file(),
		"    ",
		lsp(),
		"%=",
		position(),
		" ",
	})
end

vim.o.statusline = "%!v:lua.Statusline()"
