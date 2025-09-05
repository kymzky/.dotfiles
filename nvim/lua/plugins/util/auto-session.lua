return {
	"rmagatti/auto-session",
	tag = "v2.5.0",
	lazy = false,
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "/", "~/", "~/Downloads" },
		})
	end,
}
