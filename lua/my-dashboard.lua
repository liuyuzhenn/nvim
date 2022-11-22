-- local home = os.getenv('HOME')
local db = require('dashboard')

function custom_header()
header = {
  '',
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
 '',
 '',
}
table.insert(header, '🌏Hey There!')
end

-- db.default_banner = header
db.custom_header = header

db.custom_center = {
    -- {icon = '  ',
    -- desc = 'Recently latest session                  ',
    -- shortcut = 'SPC s l',
    -- action ='SessionLoad'},
    -- {icon = '  ',
    -- desc = 'Recently opened files                   ',
    -- action =  'DashboardFindHistory',
    -- shortcut = 'SPC f h'},
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


db.custom_footer = {'🎉 Welcom to NEOVIM!'}
