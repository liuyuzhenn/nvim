filetype plugin indent on    " required
language en
let mapleader = "\<space>"
" change default shell to pwshell
"set shell=pwsh.exe
"set shellcmdflag=-c
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set showcmd
set termguicolors
set background=dark
set nu
set cursorline
set relativenumber
set mouse=a
set encoding=utf-8
set foldmethod=indent
set foldlevel=9999
"set foldminlines=10
set nobackup
set tabstop=4
set shiftwidth=4
set nowrap

" colorscheme
colorscheme deus
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" NORMAL MODE
nmap <c-s> xi
nmap S :w<CR>
nmap Q :q<CR>
nmap ; :
nmap <space> <nop>
" switch buffer
nnoremap <C-j> <Cmd>wincmd j<CR>
nnoremap <C-k> <Cmd>wincmd k<CR>
nnoremap <C-h> <Cmd>wincmd h<CR>
nnoremap <C-l> <Cmd>wincmd l<CR>
nnoremap <silent><leader>n :noh<CR>
" split
nmap sl :set splitright<CR>:vsplit<CR>
nmap sh :set nosplitright<CR>:vsplit<CR>
nmap sk :set nosplitbelow<CR>:split<CR>
nmap sj :set splitbelow<CR>:split<CR>
nmap tu :tabe<CR>
nmap tl :+tabnext<CR>
nmap th :-tabnext<CR>

" save and close all
nmap ZZ :wa<CR>:qa<CR>
nmap th :-tabnext<CR>
nmap <tab> gt

" INSERT MODE
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>

map <up> :res +3<CR>
map <down> :res -3<CR>
map <left> :vertical resize -3<CR>
map <right> :vertical resize +3<CR>
map J <nop>
map K <nop>
"map <C-c> <ESC>

lua require('user.autocmd')

if !exists('g:vscode')
	nmap R :source $MYVIMRC<CR>
	nmap <A-h> :bp<cr>
	nmap <A-l> :bn<cr>
endif

