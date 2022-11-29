local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

local home = os.getenv('HOME')
local empty=[[]]
db.session_directory = home .. '/.cache/nvim/DSSession'
db.custom_header = {
  empty,
  empty,
  [[        ▄▄▄▄▄███████████████████▄▄▄▄▄     ]],
  [[      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   ]],
  [[     █▀████████▄             ▀▀████ ▀██▄  ]],
  [[    █▄▄██████████████████▄▄▄         ▄██▀ ]],
  [[     ▀█████████████████████████▄    ▄██▀  ]],
  [[       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    ]],
  [[         ▀███▄              ▀██████▀      ]],
  [[           ▀██████▄        ▄████▀         ]],
  [[              ▀█████▄▄▄▄▄▄▄███▀           ]],
  [[                ▀████▀▀▀████▀             ]],
  [[                  ▀███▄███▀               ]],
  [[                     ▀█▀                  ]],
  empty
  }
db.custom_center = {
	      {icon = '  ',
      desc = 'Recently latest session                 ',
      shortcut = 'SPC g l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=find',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f g'},
    }

vim.api.nvim_set_keymap('n', '<leader>gl', ':SessionLoad<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>gs', ':SessionSave<CR>', { noremap = true, silent = false })
vim.api.nvim_create_autocmd('User', {
pattern = 'DBSessionSavePre',
callback = function()
pcall(vim.cmd, 'NvimTreeClose')
end,
})

vim.cmd([[
hi link DashboardHeader Label
hi link DashboardCenter Identifier
hi link DashboardShortCut String
hi link DashboardFooter Comment
]])
