local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local ok, actions = pcall(require, "telescope.actions")
if not ok then
	return
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
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
			"rg",
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
			theme = "dropdown",
			previewer = false,
			find_command = { "fd", "-I" },
			prompt_prefix = "🔍",
		},
	},
	extensions = {
		bookmarks = {
			-- Available:
			--  * 'chrome'
			--  * 'edge'
			--  * 'firefox'
			selected_browser = "chrome",
			-- Either provide a shell command to open the URL
			url_open_command = nil,

			-- Or provide the plugin name which is already installed
			-- Available: 'vim_external', 'open_browser'
			url_open_plugin = "open_browser",
			-- Show the full path to the bookmark instead of just the bookmark name
			full_path = true,

			-- Provide a custom profile name for Firefox browser
			firefox_profile_name = nil,

			-- Provide a custom profile name for Waterfox browser
			waterfox_profile_name = nil,

			-- Add a column which contains the tags for each bookmark for buku
			buku_include_tags = false,

			-- Provide debug messages
			debug = false,
		},
		file_browser = {
			theme = "dropdown",
			--path = "%:p:h",
			previewer = false,
			hidden = false,
			hide_parent_dir = false,
			collapse_dirs = true,
			initial_mode = "insert",
			hijach_netw = false,
			--layerout_config = { height = 40 },
			mappings = {
				i = {
					["<C-u>"] = fb_actions.goto_parent_dir,
				},
				n = {
					--["a"] = fb_actions.create,
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
				vim.api.nvim_put({ emoji.value }, "c", false, true)
			end,
		},
	},
})

local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.commands, {})
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})
vim.keymap.set("n", "<leader>fc", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", extensions.file_browser.file_browser, {})
vim.keymap.set("n", "<leader>fm", extensions.bookmarks.bookmarks, {})
vim.keymap.set("n", "<leader>fs", "<Cmd>SearchSession<CR>", {})

-- To get telescope-file-browser loaded and woforirking with telescope,
-- you need to call load_extension, somewhere after setup function:
telescope.load_extension("file_browser")
telescope.load_extension("ultisnips")
telescope.load_extension("emoji")
telescope.load_extension("bookmarks")
telescope.load_extension("dap")
telescope.load_extension("session-lens")
