--view.mappings.list = { -- BEGIN_DEFAULT_MAPPINGS
--{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
--{ key = "<C-e>",                          action = "edit_in_place" },
--{ key = "O",                              action = "edit_no_picker" },
--{ key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
--{ key = "<C-v>",                          action = "vsplit" },
--{ key = "<C-x>",                          action = "split" },
--{ key = "<C-t>",                          action = "tabnew" },
--{ key = "<",                              action = "prev_sibling" },
--{ key = ">",                              action = "next_sibling" },
--{ key = "P",                              action = "parent_node" },
--{ key = "<BS>",                           action = "close_node" },
--{ key = "<Tab>",                          action = "preview" },
--{ key = "K",                              action = "first_sibling" },
--{ key = "J",                              action = "last_sibling" },
--{ key = "C",                              action = "toggle_git_clean" },
--{ key = "I",                              action = "toggle_git_ignored" },
--{ key = "H",                              action = "toggle_dotfiles" },
--{ key = "B",                              action = "toggle_no_buffer" },
--{ key = "U",                              action = "toggle_custom" },
--{ key = "R",                              action = "refresh" },
--{ key = "a",                              action = "create" },
--{ key = "d",                              action = "remove" },
--{ key = "D",                              action = "trash" },
--{ key = "r",                              action = "rename" },
--{ key = "<C-r>",                          action = "full_rename" },
--{ key = "e",                              action = "rename_basename" },
--{ key = "x",                              action = "cut" },
--{ key = "c",                              action = "copy" },
--{ key = "p",                              action = "paste" },
--{ key = "y",                              action = "copy_name" },
--{ key = "Y",                              action = "copy_path" },
--{ key = "gy",                             action = "copy_absolute_path" },
--{ key = "[e",                             action = "prev_diag_item" },
--{ key = "[c",                             action = "prev_git_item" },
--{ key = "]e",                             action = "next_diag_item" },
--{ key = "]c",                             action = "next_git_item" },
--{ key = "-",                              action = "dir_up" },
--{ key = "s",                              action = "system_open" },
--{ key = "f",                              action = "live_filter" },
--{ key = "F",                              action = "clear_live_filter" },
--{ key = "q",                              action = "close" },
--{ key = "W",                              action = "collapse_all" },
--{ key = "E",                              action = "expand_all" },
--{ key = "S",                              action = "search_node" },
--{ key = ".",                              action = "run_file_command" },
--{ key = "<C-k>",                          action = "toggle_file_info" },
--{ key = "g?",                             action = "toggle_help" },
--{ key = "m",                              action = "toggle_mark" },
--{ key = "bmv",                            action = "bulk_move" },
--} -- END_DEFAULT_MAPPINGS
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
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
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
				{ key = { "v" }, action = "vsplit" },
				{ key = { "l" }, action = "edit" },
				{ key = "cd", action = "cd" },
			},
		},
		float = {
			enable = false,
			quit_on_focus_loss = false,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 400,
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
		root_folder_modifier = ':t',
		highlight_git = true,
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true
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
				}
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

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
map('n', '<A-e>', ':NvimTreeToggle<CR>', opt)
