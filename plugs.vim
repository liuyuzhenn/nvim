function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
set rtp+=$VIM/plugs/vim-plug
call plug#begin('$VIM/plugs')

Plug 'mg979/vim-visual-multi'

Plug 'tpope/vim-surround'

Plug 'iamcco/markdown-preview.vim'

"
""NerdCommenter
"
Plug 'preservim/nerdcommenter'
" Create default mappings


"
" NerdTree
"
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'gcmt/wildfire.vim'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/szw/vim-maximizer.git'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/ycm-core/YouCompleteMe.git' 
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()            " required

