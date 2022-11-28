local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

--require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

dap.adapters.python = {
	type = "executable",
	command = os.getenv("CONDA_PREFIX") .. "/python.exe",
	args = { "-m", "debugpy.adapter" },
}

--dap.defaults.fallback.terminal_win_cmd = 'split new'
--dap.defaults.fallback.focus_terminal = true
dap.configurations.python = {
	{
		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",
		console = "integratedTerminal",
		stopOnEntry = true,
		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = os.getenv("CONDA_PREFIX") .. "/python.exe",
		--args = function()
		--local input = vim.fn.input("Input args: ")
		--return require("user.dap.dap-util").str2argtable(input)
		--end,
	},
}

--dap.adapters.lua = {
--type = "executable",
--command = "C:/Users/23792/.vscode/extensions/actboy168.lua-debug-1.60.1-win32-x64/bin/lua-debug.exe",
----args = {'-e',  'dofile[[c:/Users/23792/.vscode/extensions/actboy168.lua-debug-1.60.1-win32-x64/script/launch.lua]];DBG[[11252-ansi]]' };
--}

dap.adapters.lua = function(callback, config)
	callback({
		type = "server",
		host = config.host,
		command = "C:/Users/23792/.vscode/extensions/actboy168.lua-debug-1.60.1-win32-x64/bin/lua-debug.exe",
		port = config.port,
	})
end

dap.configurations.lua = {
	{
		type = "lua",
		request = "lauch",
		name = "Attach to running Neovim instance",
		cwd = "${workspaceFolder}",
		console = "integratedTerminal",
		program = "${file}",
		host = function()
			local value = vim.fn.input("Host [127.0.0.1]: ")
			if value ~= "" then
				return value
			end
			return "127.0.0.1"
		end,
		port = function()
			local val = tonumber(vim.fn.input("Port: "))
			assert(val, "Please provide a port number")
			return val
		end,
	},
}
--dap.configurations.lua = {
--{
--type = "lua",
--request = "launch",
--name = "Launch file",
--stopOnEntry = false,
--console = "integratedTerminal",
--program = "${file}",
--},
--}

vim.cmd([[
    nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
    nnoremap <silent> <F4> <Cmd>lua require'dap'.terminate()<CR>
    nnoremap <silent> <A-1> <Cmd>lua require'dap'.step_into()<CR>
    nnoremap <silent> <A-2> <Cmd>lua require'dap'.step_over()<CR>
    nnoremap <silent> <A-3> <Cmd>lua require'dap'.run_to_cursor()<CR>
    nnoremap <silent> <leader>dd <Cmd>lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>dr <Cmd>lua require'dap'.repl.toggle({},'vsplit')<CR>
]])

--nnoremap <silent> <leader>di <Cmd>lua require'dap.ui.widgets'.hover()<CR>
--nnoremap <silent> <leader>dp <Cmd>lua require'dap.ui.widgets'.preview()<CR>

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
