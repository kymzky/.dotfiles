local dap_config = require('config.dap')
return {
	'mfussenegger/nvim-dap',
	tag = '0.10.0',
	event = 'VeryLazy',
	config = function()
		local dap = require('dap')
		dap.adapters = dap_config.adapters
		dap.configurations = dap_config.configurations
	end,
}
