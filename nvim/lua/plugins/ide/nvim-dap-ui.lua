return {
	"rcarriga/nvim-dap-ui",
	commit = "bc81f8d",
	event = "VeryLazy",
	opts = {
		layouts = {
			{
				elements = {
					{ id = "repl", size = 1.0 },
				},
				size = 20,
				position = "bottom",
			},
			{
				elements = {
					{ id = "breakpoints", size = 0.4 },
					{ id = "scopes", size = 0.5 },
				},
				size = 70,
				position = "right",
			},
		},
		controls = {
			enabled = false,
		},
	},
	config = function(_, opts)
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup(opts)
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end
	end,
}
