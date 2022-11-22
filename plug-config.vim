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



" EasyMotion
if !exists('g:vscode')
	nmap mp :MarkdownPreview<CR>
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
	
	" COC
	set nobackup
	set nowritebackup
	set updatetime=300
	set signcolumn=yes


	" let g:ale_sign_error = '✗'
	" let g:ale_sign_warning = '⚡'
	" highlight CocFloating ctermbg=2 ctermfg=1
	inoremap <silent><expr> <C-j>
	      \ coc#pum#visible() ? coc#pum#next(1) :
	      \ CheckBackspace() ? "\<Tab>" :
	      \ coc#refresh()
	inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	
	" Make <CR> to accept selected completion item or notify coc.nvim to format
	" <C-g>u breaks current undo, please make your own choice.
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
	                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	
	function! CheckBackspace() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	
	" Use <c-space> to trigger completion.
	if has('nvim')
	  inoremap <silent><expr> <c-space> coc#refresh()
	else
	  inoremap <silent><expr> <c-@> coc#refresh()
	endif
	
	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)
	
	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	
	" Use K to show documentation in preview window.
	nnoremap <silent> K :call ShowDocumentation()<CR>

	function! ShowDocumentation()
	  if CocAction('hasProvider', 'hover')
	    call CocActionAsync('doHover')
	  else
	    call feedkeys('K', 'in')
	  endif
	endfunction
	
	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')
	
	" Symbol renaming.
	nmap <leader>r <Plug>(coc-rename)

	hi CocHintFloat guibg=#AFD787 guifg=#FF7AA3 ctermbg=2 ctermfg=1
	let g:coc_status_error_sign='✗'
	let g:coc_status_warning_sign='⚡'
	
	"
	"air-line
	""
	let g:airline_theme = 'bubblegum' " deus
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#show_tab_nr = 1
	let g:airline#extensions#tabline#buffer_nr_show = 1
	let g:airline#extensions#tabline#fnametruncate = 16
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	if !exists('airline_symbols')
			let g:airline_symbols={}
	endif
	let laststatus = 2
	
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
	
	nnoremap <leader>m :MaximizerToggle<CR>
	
	" Telescope config
	nnoremap <leader>gf <cmd>Telescope find_files<cr>
	nnoremap <leader>gg <cmd>Telescope live_grep<cr>
	nnoremap <leader>gb <cmd>Telescope file_browser<cr>
	nnoremap <leader>gh <cmd>Telescope help_tags<cr>
	nnoremap <leader>gd <cmd>Telescope dotfiles<cr>
	

	lua require('my-dashboard')
	lua require('my-telescope')

else
	" nmap <leader>s <Plug>(easymotion-s2)
	map <space> <Plug>(easymotion-prefix)
	map  / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)
	map  n <Plug>(easymotion-next)
	map  N <Plug>(easymotion-prev)
	map <leader>s <Plug>(easymotion-bd-f2)
endif


" All of your Plugins must be added before the following line 
" filetype plugin indent on    " required
" =======================================================
