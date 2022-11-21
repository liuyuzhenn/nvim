language en
filetype off
syntax on

let mapleader = "\<space>"
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
colorscheme deus
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set showcmd
set termguicolors
set background=dark
set nu
set cursorline
set relativenumber
set tabstop=4
set mouse=r
set encoding=utf-8
set shiftwidth=4
set fdm=indent
" set foldmethod=manual
set foldmethod=indent
set foldminlines=30

" NORMAL MODE
nmap <c-s> xi
nmap S :w<CR>
nmap Q :q<CR>
nmap R :source $MYVIMRC<CR>
nmap ; :
nmap W :bd<CR>

if !exists('g:vscode')
	nnoremap <leader><leader> :tabe<CR>:edit $MYVIMRC<CR>
endif
nnoremap <leader>r gD:%s/<C-R>///gc<left><left><left>

" INSERT MODE
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" split
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <up> :res +3<CR>
map <down> :res -3<CR>
map <left> :vertical resize -3<CR>
map <right> :vertical resize +3<CR>
map tu :tabe<CR>
map tl :+tabnext<CR>
map th :-tabnext<CR>
map s <nop>
map J <nop>
map K <nop>
map <C-c> <ESC>

if exists('g:vscode')
	source $HOME/AppData/Local/.config/nvim/vscode.vim
endif

" ##################################################
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction


set rtp+=$VIM/plugs/vim-plug
call plug#begin('$VIM/plugs')

Plug 'mg979/vim-visual-multi'

Plug 'tpope/vim-surround'

Plug 'iamcco/markdown-preview.vim'
nmap mp :MarkdownPreview<CR>

"
""NerdCommenter
"
Plug 'preservim/nerdcommenter'
" Create default mappings
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDTreeShowHidden = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
map <leader>cc <plug>NERDCommenterToggle
map <leader>u <plug>nerdcommenteruncomment

Plug 'ryanoasis/vim-devicons'

"
" NerdTree
"
Plug 'https://github.com/preservim/nerdtree.git'
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" nmap ss :NERDTree<CR>:q<CR>:mksession!<CR>

Plug 'gcmt/wildfire.vim'

Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger='<c-w>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:snips_author='liuyuzhen'
let g:snips_email='liuyuzhen22@mails.ucas.ac.cn'
let g:snips_github='https://github.com/liuyuzhenn'

"
""ALE
"
Plug 'w0rp/ale'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_sign_warning = '!'
let g:ale_completion_autoimport = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_leave = 1
let g:ale_lint_delay = 200
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_statusline_format = ['✗ %d', '! %d', '✔ OK']
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
" let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"
let g:ale_python_pylint_change_directory=0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" fugitive
Plug 'tpope/vim-fugitive'

" 
"  "YCM 
"   "

Plug 'https://github.com/ycm-core/YouCompleteMe.git' 
set completeopt=menu,menuone 
let g:ycm_clangd_args=['--header-insertion=never'] 
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0 
let g:ycm_show_diagnostics_ui = 0 
let g:ycm_add_preview_to_completeopt = 0 
let g:ycm_seed_identifiers_with_syntax = 0 
let g:ycm_semantic_triggers = { 
\ 'c' : ['->', '.'], 
\ 'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 
\ 're!\[.*\]\s'], 
\ 'ocaml' : ['.', '#'], 
\ 'VimspectorPrompt': [ '.', '->', ':', '<' ], 
\ 'cpp,objcpp' : ['->', '.', '::'], 
\ 'perl' : ['->'], 
\ 'php' : ['->', '::'], 
\ 'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'], 
\ 'ruby' : ['.', '::'], 
\ 'lua' : ['.', ':'], 
\ 'erlang' : [':'], 
\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'], 
\ 'cs,lua,javascript': ['re!\w{2}'], 
\ } 
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgray 
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgray guibg=black 
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR> 
nnoremap gr :YcmCompleter GoToReferences<CR>

Plug 'easymotion/vim-easymotion'
" map <space> <Plug>(easymotion-prefix)

" inside plug#begin:
" use normal easymotion when in VIM mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
if !exists('g:vscode')
	map <space> <Plug>(easymotion-prefix)
endif


" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"
" " These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
map <leader>s <Plug>(easymotion-bd-f2)
nmap <leader>s <Plug>(easymotion-overwin-f2)

"
"
" " Move to line
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)
"
" " Move to word
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

"air-line
""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
if !exists('airline_symbols')
		let g:airline_symbols={}
endif
let laststatus = 2

" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ''
let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ' :'
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.dirty='⚡'

" let g:airline_section_z=""
let g:airline_section_warning=""
"
let g:airline#extensions#ale#enabled = 1

Plug 'https://github.com/szw/vim-maximizer.git'
nnoremap <leader>m :MaximizerToggle<CR>

" All of your Plugins must be added before the following line 
call plug#end()            " required
" filetype plugin indent on    " required
" =======================================================
