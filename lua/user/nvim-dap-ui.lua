local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	return
end

local status, dap = pcall(require, "dap")
if not status then
	return
end

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
--dap.listeners.before.event_terminated["dapui_config"] = function()
--dapui.close()
--end
--dap.listeners.before.event_exited["dapui_config"] = function()
--dapui.close()
--end

dapui.setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Use this to override mappings for specific elements
	element_mappings = {
		-- stacks = {
		--   open = "<CR>",
		--   expand = "o",
		-- }
	},
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				--{ id = "breakpoints", size = 0 },
				{ id = "stacks", size = 0.15 },
				{ id = "watches", size = 0.4 },
				{ id = "scopes", size = 0.45 },
			},
			size = 30,
			position = "left",
		},
		{
			elements = {
				{ id = "repl", size = 0.6 },
				{ id = "console", size = 0.4 },
			},
			size = 0.22, -- 25% of total lines
			position = "right",
		},
	},
	floating = {
		max_height = 0.7,
		max_width = 0.5, -- Floats will be treated as percentage of your screen.
		border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "console",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
})

vim.cmd([[
	vnoremap <A-k> <Cmd>lua require("dapui").eval()<CR>
	nnoremap <A-k> <Cmd>lua require("dapui").eval()<CR>
	nnoremap <leader>dp <Cmd>lua require("dapui").toggle()<CR>
	nnoremap <leader>do <Cmd>lua require("dapui").toggle({reset=true})<CR>
]])
