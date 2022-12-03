function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"set rtp+=$VIM/plugs/vim-plug

call plug#begin()
if !exists('g:vscode')
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'phaazon/hop.nvim'
	Plug 'nvim-telescope/telescope-file-browser.nvim'
	Plug 'preservim/tagbar'
	Plug 'norcalli/nvim-colorizer.lua'
 	Plug 'nvim-tree/nvim-web-devicons' 
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
	Plug 'tpope/vim-fugitive'
	Plug 'windwp/nvim-autopairs'
	"Plug 'lervag/vimtex'
	"Plug 'liuchengxu/vim-clap'
	"Plug 'mhinz/vim-startify'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'https://github.com/szw/vim-maximizer.git'
	Plug 'mg979/vim-visual-multi'
	Plug 'mfussenegger/nvim-dap'
	Plug 'rcarriga/nvim-dap-ui'
	Plug 'glepnir/dashboard-nvim'
	Plug 'nvim-telescope/telescope-file-browser.nvim'
	Plug 'nvim-telescope/telescope-media-files.nvim'
	Plug 'fhill2/telescope-ultisnips.nvim'
	"Plug 'xiyaowong/telescope-emoji.nvim'
	Plug 'nvim-telescope/telescope-dap.nvim'
	Plug 'akinsho/bufferline.nvim'
	"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'moll/vim-bbye'
	Plug 'rmagatti/auto-session'
	Plug 'rmagatti/session-lens'
	"
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
	Plug 'tanvirtin/monokai.nvim'
endif

Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'preservim/nerdcommenter'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'

call plug#end()            " required

