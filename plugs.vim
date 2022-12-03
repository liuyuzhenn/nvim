function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"set rtp+=$VIM/plugs/vim-plug

call plug#begin('$VIM/plugs')
if !exists('g:vscode')
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'lervag/vimtex'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	"Plug 'easymotion/vim-easymotion'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'nvim-telescope/telescope-file-browser.nvim'
	Plug 'fhill2/telescope-ultisnips.nvim'
	Plug 'xiyaowong/telescope-emoji.nvim'
	Plug 'dhruvmanila/telescope-bookmarks.nvim'
	Plug 'nvim-telescope/telescope-dap.nvim'
	Plug 'preservim/tagbar'
	Plug 'norcalli/nvim-colorizer.lua'
 	Plug 'nvim-tree/nvim-web-devicons' 
	Plug 'tyru/open-browser.vim'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'akinsho/bufferline.nvim'
	Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
	Plug 'tpope/vim-fugitive'
	"Plug 'liuchengxu/vim-clap'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'glepnir/dashboard-nvim'
	Plug 'https://github.com/szw/vim-maximizer.git'
	"Plug 'declancm/windex.nvim'
	"Plug 'declancm/maximize.nvim'
	Plug 'mg979/vim-visual-multi'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'mhartington/formatter.nvim'
	Plug 'windwp/nvim-autopairs'
	Plug 'famiu/bufdelete.nvim'
	Plug 'folke/todo-comments.nvim'
	
	Plug 'mfussenegger/nvim-dap'
	Plug 'mfussenegger/nvim-dap-python'
	Plug 'rcarriga/nvim-dap-ui'
	Plug 'rmagatti/auto-session'
	Plug 'rmagatti/session-lens'

	" completion
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'quangnguyen30192/cmp-nvim-ultisnips'
	Plug 'onsails/lspkind.nvim'  " vscode pictograms

	" lsp 
	Plug 'williamboman/mason.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

	" colorscheme
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'EdenEast/nightfox.nvim'  
	Plug 'ellisonleao/gruvbox.nvim' 
	"Plug 'NTBBloodbath/doom-one.nvim'
	Plug 'tanvirtin/monokai.nvim'
endif

"Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'preservim/nerdcommenter'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'phaazon/hop.nvim'

call plug#end()            " required

