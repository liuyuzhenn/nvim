return {
	"git@github.com:mfussenegger/nvim-dap.git",
	config = function()
		local status_ok, dap = pcall(require, "dap")
		if not status_ok then
			return
		end

		-- local conda_path = "/home/liuyuzhen/anaconda3"
		dap.adapters.python = {
			type = "executable",
			--command = os.getenv("CONDA_PREFIX") .. "/bin/python",
			command = (os.getenv("CONDA_PREFIX") or "") .. "/bin/python",
			-- command = "/bin/python",
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
				name = "default",
				console = "integratedTerminal",
				stopOnEntry = false,
				program = "${file}", -- This configuration will launch the current file if used.
				cwd = "${workspaceFolder}",
				pythonPath = (os.getenv("CONDA_PREFIX") or "") .. "/bin/python",
			},
		}

		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = 'executable',
			command = vim.fn.stdpath('data') .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
		}

		dap.configurations.cpp = {
			{
				name = "default",
				type = "cppdbg",
				request = "launch",
				program = function()
					local p = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/bin/', 'file')
					return p
				end,
				cwd = '${workspaceFolder}',
				stopAtEntry = false,
			}
		}

		require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "cpp" } })

		vim.cmd([[
    nnoremap <silent> <F1> <Cmd>lua require'dap'.step_into()<CR>
    nnoremap <silent> <F2> <Cmd>lua require'dap'.step_over()<CR>
    nnoremap <silent> <F3> <Cmd>lua require'dap'.step_out()<CR>
    nnoremap <silent> <F4> <Cmd>lua require'dap'.run_to_cursor()<CR>
    nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
    nnoremap <silent> <F6> <Cmd>lua require'dap'.terminate()<CR>
    nnoremap <silent> <leader>dc <Cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>
    nnoremap <silent> <leader>dd <Cmd>lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>dr <Cmd>lua require'dap'.repl.toggle({},'vsplit')<CR>
		nnoremap  <leader>lj <Cmd>lua require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "cpp" } })<CR>
]])


		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		--vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "🦄", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })

	end
}
