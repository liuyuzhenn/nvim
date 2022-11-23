function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

set rtp+=$VIM/plugs/vim-plug

call plug#begin('$VIM/plugs')
if !exists('g:vscode')
	Plug 'iamcco/markdown-preview.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"Plug 'glepnir/dashboard-nvim'
	Plug 'easymotion/vim-easymotion'
	Plug 'nvim-telescope/telescope-file-browser.nvim'
	Plug 'preservim/tagbar'
	Plug 'norcalli/nvim-colorizer.lua'
 	Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
	Plug 'tpope/vim-fugitive'
	Plug 'liuchengxu/vim-clap'
	Plug 'mhinz/vim-startify'
endif

Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'gcmt/wildfire.vim'
"Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/szw/vim-maximizer.git'

call plug#end()            " required

