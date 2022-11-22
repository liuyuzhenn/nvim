language en
filetype off
syntax on

let mapleader = "\<space>"
set nowrap
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
set foldmethod=manual
set foldlevel=9999
set foldminlines=10

" NORMAL MODE
nmap <c-s> xi
nmap S :w<CR>
nmap Q :q<CR>
nmap R :source $MYVIMRC<CR>
nmap ; :
" bwitch buffer
nmap gh :bp<cr>
nmap gl :bn<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" split
nmap sl :set splitright<CR>:vsplit<CR>
nmap sh :set nosplitright<CR>:vsplit<CR>
nmap sk :set nosplitbelow<CR>:split<CR>
nmap sj :set splitbelow<CR>:split<CR>
nmap tu :tabe<CR>
nmap tl :+tabnext<CR>
nmap th :-tabnext<CR>

nmap <tab> gt

if !exists('g:vscode')
	nmap <C-Q> :bd<CR>
	nnoremap <leader><leader> :tabe<CR>:edit $MYVIMRC<CR>
endif

" INSERT MODE
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

map <up> :res +3<CR>
map <down> :res -3<CR>
map <left> :vertical resize -3<CR>
map <right> :vertical resize +3<CR>
map s <nop>
map J <nop>
map K <nop>
map <C-c> <ESC>

