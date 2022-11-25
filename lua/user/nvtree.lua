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
	width=25,
	adaptive_size = true,
	hide_root_folder = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = {"v", "gs"}, action = "vsplit" },
        { key = "gt", action = "tabnew" },
      },
    },
  },
	git = {
    enable = true,
    ignore = false,
    timeout = 500,
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
	  dotfiles=false,
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
local opt = {noremap = true, silent = true }
map('n', '<A-e>', ':NvimTreeToggle<CR>', opt)
