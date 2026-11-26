local lsp_config = require("config.lsp")
return {
	"neovim/nvim-lspconfig",
	tag = "v2.13.0",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.lsp.config("*", {
			capabilities = capabilities,
		})
		vim.lsp.config("dartls", {
			root_dir = function(bufnr, on_dir)
				local file = vim.api.nvim_buf_get_name(bufnr)
				for _, dir in ipairs({ vim.fn.expand("~/.asdf/installs"), vim.fn.expand("~/.pub-cache") }) do
					if vim.startswith(file, dir) then
						return
					end
				end
				local root = vim.fs.root(bufnr, { "pubspec.yaml" })
				if root then
					on_dir(root)
				end
			end,
			cmd = function(dispatchers, config)
				return vim.lsp.rpc.start(
					{ "dart", "language-server", "--protocol=lsp" },
					dispatchers,
					{ cwd = config.root_dir or vim.fn.getcwd() }
				)
			end,
		})
		vim.lsp.enable(vim.list_extend({ "dartls" }, lsp_config.servers))
	end,
}
