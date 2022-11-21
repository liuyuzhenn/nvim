
nmap mp :MarkdownPreview<CR>
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
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" nmap ss :NERDTree<CR>:q<CR>:mksession!<CR>

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

" fugitive

" 
"  "YCM 
"   "

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

" EasyMotion
if !exists('g:vscode')
	map <space> <Plug>(easymotion-prefix)
	map  / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)
	map  n <Plug>(easymotion-next)
	map  N <Plug>(easymotion-prev)
	map  <leader>f <Plug>(easymotion-bd-f)
	nmap <leader>f <Plug>(easymotion-overwin-f)
	map <leader>s <Plug>(easymotion-bd-f2)
	nmap <leader>s <Plug>(easymotion-overwin-f2)
	map <leader>l <Plug>(easymotion-bd-jk)
	nmap <leader>l <Plug>(easymotion-overwin-line)
	map  <leader>w <Plug>(easymotion-bd-w)
	nmap <leader>w <Plug>(easymotion-overwin-w)
else
	" nmap <leader>s <Plug>(easymotion-s2)
	map <space> <Plug>(easymotion-prefix)
	map  / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)
	map  n <Plug>(easymotion-next)
	map  N <Plug>(easymotion-prev)
	" map  <leader>f <Plug>(easymotion-bd-f)
	map <leader>s <Plug>(easymotion-bd-f2)
	" map <leader>l <Plug>(easymotion-bd-jk)
	" map  <leader>w <Plug>(easymotion-bd-w)
endif



"
"air-line
""
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

nnoremap <leader>m :MaximizerToggle<CR>

" All of your Plugins must be added before the following line 
" filetype plugin indent on    " required
" =======================================================
