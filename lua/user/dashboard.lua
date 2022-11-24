local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

local home = os.getenv('HOME')
  -- linux
 --db.preview_command = 'ueberzug'
  --
  --db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  --db.preview_file_height = 11
  --db.preview_file_width = 70
db.session_directory = '/user2/liuyuzhen/.cache/nvim/session'
db.custom_header = {
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
  [[                     ▀█▀                  ]]
  }
db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                 ',
      shortcut = 'SPC g l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC g f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC g b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC g g'},
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

--vim.api.nvim_create_autocmd('FileTpye',{pattern='Dashboard',command='hi link DashboardHeader Label'})
--vim.api.nvim_create_autocmd('FileTpye',{pattern='Dashboard',command='hi link DashboardCenter Identifier'})
--vim.api.nvim_create_autocmd('FileTpye',{pattern='Dashboard',command='hi link DashboardShortCut String'})
--vim.api.nvim_create_autocmd('FileTpye',{pattern='Dashboard',command='hi link DashboardFooter Comment'})
