function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"set rtp+=$VIM/plugs/vim-plug

call plug#begin('$VIM/plugs')
if !exists('g:vscode')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
	Plug 'lervag/vimtex'
	"Plug 'liuchengxu/vim-clap'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'glepnir/dashboard-nvim'
	"Plug 'https://github.com/szw/vim-maximizer.git'
	Plug 'mg979/vim-visual-multi'
	Plug 'mfussenegger/nvim-dap'
	Plug 'mfussenegger/nvim-dap-python'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'rcarriga/nvim-dap-ui'
	Plug 'mhartington/formatter.nvim'
	Plug 'windwp/nvim-autopairs'
	Plug 'famiu/bufdelete.nvim'
	Plug 'folke/todo-comments.nvim'
endif

"Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'preservim/nerdcommenter'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'phaazon/hop.nvim'

call plug#end()            " required

