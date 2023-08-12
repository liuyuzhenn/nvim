call plug#begin()
if !exists('g:vscode')
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}
	
	Plug 'git@github.com:nvim-lua/plenary.nvim.git'
	
	Plug 'git@github.com:lervag/vimtex.git'
	
	Plug 'git@github.com:nvim-treesitter/nvim-treesitter.git', {'do': ':TSUpdate'}
	
	Plug 'git@github.com:norcalli/nvim-colorizer.lua.git'
	

	" telescope
	Plug 'git@github.com:nvim-telescope/telescope.nvim.git', { 'tag': '0.1.0' }
	
	Plug 'git@github.com:nvim-telescope/telescope-file-browser.nvim.git'
	
	Plug 'git@github.com:benfowler/telescope-luasnip.nvim.git'
	
	Plug 'git@github.com:xiyaowong/telescope-emoji.nvim.git'
	
	Plug 'git@github.com:dhruvmanila/telescope-bookmarks.nvim.git'
	
	Plug 'git@github.com:nvim-telescope/telescope-dap.nvim.git'
	
	Plug 'git@github.com:tyru/open-browser.vim.git'
	
 	Plug 'git@github.com:nvim-tree/nvim-web-devicons.git' 
	
	Plug 'git@github.com:nvim-tree/nvim-tree.lua.git'
	
	Plug 'git@github.com:nvim-lualine/lualine.nvim.git'
	
	Plug 'git@github.com:akinsho/bufferline.nvim.git'
	
	Plug 'git@github.com:akinsho/toggleterm.nvim.git', {'tag' : '*'}
	
	Plug 'git@github.com:tpope/vim-fugitive.git'
	
	" Plug 'git@github.com:glepnir/dashboard-nvim.git'
	
	" Plug 'https://github.com/szw/vim-maximizer.git'
  Plug 'git@github.com:anuvyklack/windows.nvim.git'
	Plug 'git@github.com:anuvyklack/animation.nvim.git'
	Plug 'git@github.com:anuvyklack/middleclass.git'	


	Plug 'git@github.com:mg979/vim-visual-multi.git'
	
	Plug 'git@github.com:iamcco/markdown-preview.nvim.git', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	
	Plug 'git@github.com:mhartington/formatter.nvim.git'
	
	Plug 'git@github.com:famiu/bufdelete.nvim.git'
	
	Plug 'git@github.com:folke/todo-comments.nvim.git'
	
	
	" notification
	Plug 'git@github.com:rcarriga/nvim-notify.git' 
	
	
	Plug 'git@github.com:mfussenegger/nvim-dap.git'
	
	Plug 'git@github.com:mfussenegger/nvim-dap-python.git'
	
	Plug 'git@github.com:rcarriga/nvim-dap-ui.git'
	
	Plug 'git@github.com:rmagatti/auto-session.git'
	
	Plug 'git@github.com:rmagatti/session-lens.git'
	
	
	" fold
	Plug 'git@github.com:anuvyklack/pretty-fold.nvim.git'
	

	" completion
	Plug 'git@github.com:hrsh7th/cmp-nvim-lsp.git'
	
	Plug 'git@github.com:hrsh7th/nvim-cmp.git'
	
	Plug 'git@github.com:hrsh7th/cmp-buffer.git'
	
	Plug 'git@github.com:hrsh7th/cmp-path.git'
	
	Plug 'git@github.com:hrsh7th/cmp-cmdline.git'
	
	Plug 'git@github.com:rcarriga/cmp-dap.git'

	Plug 'git@github.com:saadparwaiz1/cmp_luasnip.git'
	
	"Plug 'hrsh7th/cmp-omni' " autocompletion bug
	"Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
	"Plug 'kdheepak/cmp-latex-symbols'
	Plug 'git@github.com:ray-x/lsp_signature.nvim.git'
	
	Plug 'git@github.com:onsails/lspkind.nvim.git'  " vscode pictograms
	
	Plug 'git@github.com:windwp/nvim-autopairs.git'
	

	" lsp 
	Plug 'git@github.com:williamboman/mason.nvim.git'
	
	Plug 'git@github.com:neovim/nvim-lspconfig.git'
	
	Plug 'git@github.com:glepnir/lspsaga.nvim.git', { 'branch': 'main' }
	

	" colorscheme
	Plug 'git@github.com:folke/tokyonight.nvim.git', { 'branch': 'main' }
	
	Plug 'git@github.com:EdenEast/nightfox.nvim.git'  
	
	Plug 'git@github.com:ellisonleao/gruvbox.nvim.git' 

	"Plug 'NTBBloodbath/doom-one.nvim'
	Plug 'git@github.com:tanvirtin/monokai.nvim.git'
	
endif

Plug 'git@github.com:numToStr/Comment.nvim.git'

Plug 'git@github.com:gcmt/wildfire.vim.git'

Plug 'git@github.com:tpope/vim-surround.git'

Plug 'git@github.com:phaazon/hop.nvim.git'

Plug 'git@github.com:L3MON4D3/LuaSnip.git'


call plug#end()            " required


" source $HOME/AppData/Local/nvim/plugs.vim
source $HOME/AppData/Local/nvim/general.vim
" source $HOME/AppData/Local/nvim/plug-config.vim

" if has_key(g:plugs, "vim-maximizer")
" 	nnoremap <silent><leader>m <Cmd>MaximizerToggle<CR>
" 	let g:maximizer_default_mapping_key = ''
" endif

lua require('user.mason')
lua require('user.telescope')
lua require('user.colorizer')
lua require('user.nvim-tree')
lua require('user.toggleterm')
lua require('user.lualine')
lua require('user.bufferline')
lua require('user.treesitter')
lua require('user.markdown-preview')
lua require('user.windows')
lua require('user.nvim-dap')
lua require('user.nvim-dap-ui')
lua require('user.hop')
" lua require('user.leap')
lua require('user.surround')
lua require('user.formatter')
lua require('user.dashboard')
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
lua require('user.nvim-autopairs')


if exists('g:vscode')
	source $HOME/AppData/Local/nvim/vscode.vim
else
endif


