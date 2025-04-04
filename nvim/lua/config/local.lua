local function load_project_specific_settings()
	local nvim_lua = vim.fn.getcwd() .. '/.nvim.lua'
	local file_handle = io.open(nvim_lua, 'r')

	if file_handle then
		local contents = file_handle:read('*a')
		file_handle:close()

		local success, err = pcall(function()
			return load(contents)()
		end)

		if not success then
			print('Error executing .nvim.lua:', err)
		end
	end
end

load_project_specific_settings()
