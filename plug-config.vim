if has_key(g:plugs, "vim-maximizer")
	nnoremap <silent><leader>m <Cmd>MaximizerToggle<CR>
	let g:maximizer_default_mapping_key = ''
endif

lua require('user.mason')
lua require('user.telescope')
lua require('user.colorizer')
lua require('user.nvim-tree')
lua require('user.toggleterm')
lua require('user.lualine')
lua require('user.bufferline')
lua require('user.treesitter')
lua require('user.markdown-preview')
lua require('user.nvim-dap')
lua require('user.nvim-dap-ui')
lua require('user.hop')
lua require('user.surround')
lua require('user.formatter')
lua require('user.dashboard')
lua require('user.nvim-autopairs')
lua require('user.bufdelete')
lua require('user.todo-comments')
lua require('user.auto-session')
lua require('user.nvim-notify')
lua require('user.pretty-fold')
lua require('user.vimtex')
lua require('user.lspconfig')
lua require('user.lsp-signature')
lua require('user.nvim-cmp')
lua require('user.lspkind')
lua require('user.lspsaga')
lua require('user.comment')
lua require('user.autocmd')
lua require('user.luasnip')
lua require('user.notify')


