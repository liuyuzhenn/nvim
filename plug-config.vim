
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger='<c-w>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:snips_author='liuyuzhen'
let g:snips_email='liuyuzhen22@mails.ucas.ac.cn'
let g:snips_github='https://github.com/liuyuzhenn'

nnoremap <leader>m :MaximizerToggle<CR>

"hi DashboardHeader guifg=1 guibg=3 

lua require('user.mason')
lua require('user.telescope')
lua require('user.colorizer')
lua require('user.nvtree')
lua require('user.toggleterm')
lua require('user.lualine')
lua require('user.treesitter')
lua require('user.vimtex')
lua require('user.surround')
lua require('user.nvim-autopairs')
lua require('user.auto-session')

lua require('user.nvim-dap')
lua require('user.nvim-dap-ui')
lua require('user.dashboard')
lua require('user.hop')
lua require('user.bufferline')
lua require('user.autocmd')
lua require('user.lspconfig')
lua require('user.nvim-cmp')
lua require('user.lspkind')
lua require('user.lspsaga')
