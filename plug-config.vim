
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger='<c-w>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:snips_author='liuyuzhen'
let g:snips_email='liuyuzhen22@mails.ucas.ac.cn'
let g:snips_github='https://github.com/liuyuzhenn'


if !exists('g:vscode')
	nmap <F8> :TagbarToggle<CR>
	let g:tagbar_ctags_bin = 'E:\software\ctags\ctags.exe'
	let g:tagbar_type_markdown = {
  \ 'ctagstype'	: 'markdown',
  \ 'kinds'		: [
    \ 'c:chapter:0:1',
    \ 's:section:0:1',
    \ 'S:subsection:0:1',
    \ 't:subsubsection:0:1',
    \ 'T:l4subsection:0:1',
    \ 'u:l5subsection:0:1',
  \ ],
  \ 'sro'			: '""',
  \ 'kind2scope'	: {
    \ 'c' : 'chapter',
    \ 's' : 'section',
    \ 'S' : 'subsection',
    \ 't' : 'subsubsection',
    \ 'T' : 'l4subsection',
  \ },
  \ 'scope2kind'	: {
    \ 'chapter' : 'c',
    \ 'section' : 's',
    \ 'subsection' : 'S',
    \ 'subsubsection' : 't',
    \ 'l4subsection' : 'T',
  \ },
\ }

    "nmap <silent> <F9> <Plug>MarkdownPreview        
    "imap <silent> <F9> <Plug>MarkdownPreview        
    "nmap <silent> <F10> <Plug>StopMarkdownPreview    
    "imap <silent> <F10> <Plug>StopMarkdownPreview    

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

	" highlight CocFloating ctermbg=2 ctermfg=1
	inoremap <silent><expr> <C-j>
	      \ coc#pum#visible() ? coc#pum#next(0) : "\<C-j>"
		  "\ CheckBackspace() ? "\<Tab>" :
		  "\ coc#refresh()
	inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(0) : "\<C-k>"
	
	" use Tab to trigger completion
	inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
	
	function! CheckBackspace() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	hi CocMenuSel ctermbg=237 guibg=#13354A
	
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
	

	nnoremap <leader>m :MaximizerToggle<CR>


	" startify
	
	lua require('user.telescope')
	lua require('user.colorizer')
	lua require('user.nvtree')
	lua require('user.toggleterm')
	lua require('user.lualine')
	lua require('user.treesitter')
	lua require('user.vimtex')
	lua require('user.surround')
	lua require('user.markdown-preview')
	lua require('user.nvim-dap')
	lua require('user.dashboard')

	let g:startify_custom_header=[
				\ '',
				\' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
				\' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
				\' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
				\' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
				\' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
				\' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
				\'                  🌏Hey, there!                        ']

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
