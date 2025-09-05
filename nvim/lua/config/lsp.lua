local lsp = {}

lsp.servers = {
	"ansiblels",
	"bashls",
	"dockerls",
	"fish_lsp",
	"jdtls",
	"gopls",
	"helm_ls",
	"jsonls",
	"lua_ls",
	"marksman",
	"terraformls",
	manual_config = function(lspconfig)
		lspconfig.dartls.setup({
			autostart = true,
			cmd = { "dart", "--enable-analytics" },
		})
	end,
}

lsp.linters_by_ft = {
	ansible = { "ansible_lint" },
	dockerfile = { "hadolint" },
	markdown = { "markdownlint" },
	shell = { "shellcheck", "shellharden" },
	terraform = { "tflint" },
}

lsp.formatters_by_ft = {
	lua = { "stylua" },
	markdown = { "prettier" },
}

return lsp
