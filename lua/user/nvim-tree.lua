-- https://github.com/kyazdani42/nvim-tree.lua
--
-- <CR> or o on the root folder will cd in the above directory
-- <C-]> will cd in the directory under the cursor
-- <BS> will close current opened directory or parent
-- type a to add a file. Adding a directory requires leaving a leading / at the end of the path.
-- you can add multiple directories by doing foo/bar/baz/f and it will add foo bar and baz directories and f as a file
--
-- type r to rename a file
-- type <C-r> to rename a file and omit the filename on input
-- type x to add/remove file/directory to cut clipboard
-- type c to add/remove file/directory to copy clipboard
-- type y will copy name to system clipboard
-- type Y will copy relative path to system clipboard
-- type gy will copy absolute path to system clipboard
-- type p to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
-- type d to delete a file (will prompt for confirmation)
-- type D to trash a file (configured in setup())
-- type ]c to go to next git item
-- type [c to go to prev git item
-- type - to navigate up to the parent directory of the current file/directory
-- type s to open a file with default system application or a folder with default file manager (if you want to change the command used to do it see :h nvim-tree.setup under system_open)
-- if the file is a directory, <CR> will open the directory otherwise it will open the file in the buffer near the tree
-- if the file is a symlink, <CR> will follow the symlink (if the target is a file)
-- <C-v> will open the file in a vertical split
-- <C-x> will open the file in a horizontal split
-- <C-t> will open the file in a new tab
-- <Tab> will open the file as a preview (keeps the cursor in the tree)
-- I will toggle visibility of hidden folders / files which are defined by gitignores
-- D will toggle visibility of dotfiles (files/folders starting with a .)
-- R will refresh the tree
-- Double left click acts like <CR>
-- Double right click acts like <C-]>
-- W will collapse the whole tree
-- S will prompt the user to enter a path and then expands the tree to match the path
-- . will enter vim command mode with the file the cursor is on
-- C-k will toggle a popup with file infos about the file under the cursor
--
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
nvim_tree.setup({
	auto_reload_on_write = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	sort_by = "case_sensitive",
	view = {
		width = 25,
		adaptive_size = false,
		hide_root_folder = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				{ key = { "v", "gs" }, action = "vsplit" },
				{ key = { "l", "gs" }, action = "edit" },
				{ key = "gt", action = "tabnew" },
				{ key = "cd", action = "cd" },
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 100,
	},
	renderer = {
		indent_markers = {
			enable = false,
			icons = {
				corner = "└",
				edge = "│",
				none = " ",
			},
		},
		root_folder_modifier = ":t",
		highlight_git = true,
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
			webdev_colors = true,
			git_placement = "before",
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	filters = {
		custom = { "node_modules", "\\.cache" },
		dotfiles = false,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
})

local opt = { noremap = true, silent = true }
vim.keymap.set({ "n", "i" }, "<A-e>", "<Cmd>NvimTreeToggle<CR>", opt)
