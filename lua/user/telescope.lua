local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print('failed to load telescope')
  return
end

telescope.setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
		--["<Tab>"] = "move_selection_next",
		--["<S-Tab>"] = "move_selection_previous"
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>gf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gb', builtin.buffers, {})
vim.keymap.set('n', '<leader>gh', builtin.help_tags, {})
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
