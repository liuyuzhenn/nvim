local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

--require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

dap.adapters.python = {
	type = "executable",
	command = os.getenv("CONDA_PREFIX") .. "/bin/python",
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
		pythonPath = os.getenv("CONDA_PREFIX") .. "/bin/python",
		--args = function()
		--local input = vim.fn.input("Input args: ")
		--return require("user.dap.dap-util").str2argtable(input)
		--end,
	},
}


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
