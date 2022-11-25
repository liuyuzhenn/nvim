local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

--require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')


dap.adapters.python = {
  type = 'executable';
  command = 'E:/software/anaconda/python.exe';
  args = { '-m', 'debugpy.adapter' };
}

dap.defaults.fallback.terminal_win_cmd = 'split new'
dap.defaults.fallback.focus_terminal = true

dap.configurations.python = {
  {
	-- The first three options are required by nvim-dap
	type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
	request = 'launch';
	name = "Launch file";

	-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

	program = "${file}"; -- This configuration will launch the current file if used.
	pythonPath = "${env:CONDA_PYTHON_EXE}";
  },
}

vim.cmd[[
    nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
    nnoremap <silent> <A-1> <Cmd>lua require'dap'.step_into()<CR>
    nnoremap <silent> <A-2> <Cmd>lua require'dap'.step_over()<CR>
    nnoremap <silent> <A-3> <Cmd>lua require'dap'.step_out()<CR>
    nnoremap <silent> <leader>dd <Cmd>lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>dr <Cmd>lua require'dap'.repl.toggle({},'vsplit')<CR>
]]

    --nnoremap <silent> <leader>di <Cmd>lua require'dap.ui.widgets'.hover()<CR>
    --nnoremap <silent> <leader>dp <Cmd>lua require'dap.ui.widgets'.preview()<CR>

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
