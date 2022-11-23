-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "gs", action = "vsplit" },
        { key = "gx", action = "split" },
        { key = "gt", action = "tabnew" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
map('n', '<A-e>', ':NvimTreeToggle<CR>', opt)
