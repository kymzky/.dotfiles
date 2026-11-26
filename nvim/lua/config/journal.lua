local function journal()
	local base_dir = os.getenv("NOTES_PATH") or vim.fn.expand("~/notes")
	local journal_dir = base_dir .. "/01-Journal"

	local year = os.date("%Y")
	local date = os.date("%Y-%m-%d")
	local folder = journal_dir .. "/" .. year
	local filepath = folder .. "/" .. date .. ".md"

	if vim.fn.isdirectory(folder) == 0 then
		vim.fn.mkdir(folder, "p")
	end

	if vim.fn.filereadable(filepath) == 0 then
		local lines = {
			"# " .. date,
			"",
			"",
		}
		vim.fn.writefile(lines, filepath)
	end

	vim.cmd("edit " .. vim.fn.fnameescape(filepath))
	vim.cmd("normal! G$")
end

vim.keymap.set("n", "<leader>j", journal, { desc = "Open journal" })
