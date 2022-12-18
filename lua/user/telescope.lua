local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local ok, actions = pcall(require, "telescope.actions")
if not ok then
	return
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup {
	defaults = {
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.75,
			preview_cutoff = 120,
			horizontal = {
				preview_width = function(_, cols, _)
					if cols < 120 then
						return math.floor(cols * 0.5)
					end
					return math.floor(cols * 0.6)
				end,
				mirror = false,
			},
			vertical = { mirror = false },
		},
		vimgrep_arguments = {
			"/usr/bin/rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		file_ignore_patterns = {},
		path_display = { truncate = 5 },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		mappings = {
			i = {
				-- your custom insert mode mappings
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			n = {
				-- your custom normal mode mappings
			},
		},
	},
	pickers = {
		find_files = {
			theme = 'dropdown',
			previewer = false,
			find_command = { 'find' },
			prompt_prefix = "🔍"
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			--path = "%:p:h",
			previewer = false,
			hidden = false,
			initial_mode = "insert",
			hijach_netw = false,
			--layerout_config = { height = 40 },
			mappings = {
				i = {},
				n = {
					["a"] = fb_actions.create,
					["u"] = fb_actions.goto_parent_dir,
				},
			},
		},
		emoji = {
			action = function(emoji)
				-- argument emoji is a table.
				-- {name="", value="", cagegory="", description=""}

				vim.fn.setreg("*", emoji.value)
				print([[Press p or "*p to paste this emoji]] .. emoji.value)
				-- insert emoji when picked
				vim.api.nvim_put({ emoji.value }, 'c', false, true)
			end,
		},
	},
}

local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.commands, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fc', builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", extensions.file_browser.file_browser, {})
vim.keymap.set("n", "<leader>fs", "<Cmd>SearchSession<CR>", {})

-- To get telescope-file-browser loaded and woforirking with telescope,
-- you need to call load_extension, somewhere after setup function:
telescope.load_extension("file_browser")
telescope.load_extension("emoji")
telescope.load_extension("dap")
telescope.load_extension("session-lens")
telescope.load_extension("ultisnips")
