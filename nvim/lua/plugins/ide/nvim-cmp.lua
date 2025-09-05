return {
	"hrsh7th/nvim-cmp",
	tag = "v0.0.2",
	event = "InsertEnter",
	opts = function()
		local cmp = require("cmp")
		return {
			enabled = true,
			autocomplete = true,
			completion = {
				keyword_length = 1,
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 1 },
			},
		}
	end,
}
