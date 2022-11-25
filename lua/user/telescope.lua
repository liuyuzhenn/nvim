local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print('failed to load telescope')
  return
end

local ok, actions = pcall(require, "telescope.actions")
if not ok then
    return
end

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
      path_display = { "smart" },
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
      mappings = {
        ["i"] = {
		},
        ["n"] = {
        },
      },
    },
	},
  extensions = {
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>gf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gh', builtin.commands, {})
vim.keymap.set('n', '<leader>gt', builtin.treesitter, {})
vim.keymap.set('n', '<leader>gc', builtin.grep_string, {})
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
