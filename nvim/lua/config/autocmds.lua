local api = vim.api
local function augroup(name)
	return api.nvim_create_augroup(name, { clear = true })
end

api.nvim_create_autocmd({ "BufEnter" }, {
	group = augroup("ansible"),
	pattern = {
		"*/playbooks/*.yml",
		"*/playbooks/*.yaml",
		"*/roles/*/tasks/*.yml",
		"*/roles/*/tasks/*.yaml",
		"*/roles/*/handlers/*.yml",
		"*/roles/*/handlers/*.yaml",
	},
	callback = function()
		vim.opt_local.filetype = "yaml.ansible"
	end,
})

api.nvim_create_autocmd("FileType", {
	group = augroup("dart"),
	pattern = "dart",
	callback = function(args)
		local client = vim.lsp.get_clients({ name = "dartls" })[1]
		if client and not client.attached_buffers[args.buf] then
			vim.lsp.buf_attach_client(args.buf, client.id)
		end
	end,
})

api.nvim_create_autocmd("FileType", {
	group = augroup("java"),
	pattern = "java",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})

api.nvim_create_autocmd("BufEnter", {
	group = augroup("helm"),
	pattern = { "*.yaml", "*.yml" },
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local path = vim.fn.expand("%:p")
		local chart_path = vim.fn.fnamemodify(path, ":p:h") .. "/Chart.yaml"
		if vim.fn.filereadable(chart_path) == 1 then
			vim.bo[bufnr].filetype = "helm"
		end
	end,
})

api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	group = augroup("lint"),
	callback = function()
		require("lint").try_lint()
	end,
})

api.nvim_create_autocmd("FileType", {
	group = augroup("spell_check"),
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt_local.spellfile = vim.fn.stdpath("config") .. "/spell/custom.utf-8.add"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("markdown_colorcolumn"),
	pattern = "markdown",
	callback = function()
		vim.opt_local.colorcolumn = "81"
	end,
})
