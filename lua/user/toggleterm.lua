local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local powershell_options = {
	shell = vim.fn.executable("pwsh") and "pwsh" or "powershell",
	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
	shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
	shellquote = "",
	shellxquote = "",
}

for option, value in pairs(powershell_options) do
	vim.opt[option] = value
end

toggleterm.setup({
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return 20
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		else
			return 20
		end
	end,
	active = true,
	open_mapping = [[<C-t>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
	shade_terminals = true,
	shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	direction = "float",
	float_opts = {
		-- The border key is *almost* the same as 'nvim_win_open'
		-- see :h nvim_win_open for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	--vim.keymap.set("t", "<C-c>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local python = Terminal:new({ cmd = "python", hidden = true })
local lazygit = Terminal:new({ cmd = "lazygit", hidden = false })

function _PYTHON_TOGGLE()
	python:toggle()
end

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end
    
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>lua _PYTHON_TOGGLE()<CR>", {noremap = true, silent = true})
