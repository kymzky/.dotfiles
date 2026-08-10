return {
	"j-hui/fidget.nvim",
	tag = "v2.0.0",
	event = "BufReadPost",
	config = function()
		require("fidget").setup({
			notification = {
				override_vim_notify = true,
				window = {
					winblend = 0,
				},
			},
		})
	end,
}
