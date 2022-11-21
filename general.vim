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
" set foldmethod=manual
set foldmethod=indent
set foldminlines=10

" NORMAL MODE
nmap <c-s> xi
nmap S :w<CR>
nmap Q :q<CR>
nmap R :source $MYVIMRC<CR>
nmap ; :
nmap W :bd<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if !exists('g:vscode')
	nnoremap <leader><leader> :tabe<CR>:edit $MYVIMRC<CR>
	nnoremap <leader>r gD:%s/<C-R>///gc<left><left><left>
endif

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

