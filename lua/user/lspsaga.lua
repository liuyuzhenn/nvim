local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

local keymap = vim.keymap.set

saga.setup({
	ui = {
		-- currently only round theme
		theme = 'round',
		-- border type can be single,double,rounded,solid,shadow.
		border = 'solid',
		winblend = 0,
		expand = '',
		collapse = '',
		preview = ' ',
		code_action = '💡',
		diagnostic = '🐞',
		incoming = ' ',
		outgoing = ' ',
		colors = {
			--float window normal background color
			normal_bg = '#333087',
			--title background color
			title_bg = '#afd700',
			red = '#e95678',
			magenta = '#b33076',
			orange = '#FF8700',
			yellow = '#f7bb3b',
			green = '#afd700',
			cyan = '#36d0e0',
			blue = '#61afef',
			purple = '#CBA6F7',
			white = '#d1d4cf',
			black = '#1c1c19',
		},
		kind = {},
	},
	symbol_in_winbar = {
		enable = false,
	},
	outline = {
		win_position = 'right',
		win_with = '',
		win_width = 30,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = 'o',
			expand_collapse = 'l',
			quit = 'q',
		},
	},
})

keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true })
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
keymap("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>q", "<cmd>Lspsaga show_buf_diagnostics<CR>", { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>aa", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { silent = true })

keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
