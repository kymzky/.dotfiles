local dap = {}

dap.adapters = {
	flutter = {
		type = 'executable',
		command = 'flutter',
		args = { 'debug_adapter' },
	},
}

dap.configurations = {
	dart = {
		{
			type = 'flutter',
			request = 'launch',
			name = 'Launch flutter',
			dartSdkPath = 'dart',
			flutterSdkPath = 'flutter',
			program = '${workspaceFolder}/lib/main.dart',
			cwd = '${workspaceFolder}',
		},
	},
}

return dap
