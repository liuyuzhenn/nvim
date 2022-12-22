vim.cmd [[
	set conceallevel=1
  let g:vimtex_syntax_enabled = 0
  let g:vimtex_syntax_conceal_disable = 1
  let g:vimtex_view_general_viewer = 'okular'
  let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
	let g:vimtex_quickfix_mode = 0
	let g:tex_conceal='abdmg'
]]
--let g:vimtex_view_general_viewer = 'C:\Users\23792\AppData\Local\SumatraPDF\SumatraPDF.exe'
--let g:vimtex_view_general_options_latexmk = '-reuse-instance'
--let g:vimtex_view_general_options
--\ = '-reuse-instance -forward-search @tex @line @pdf'
--\ . ' -inverse-search "' . exepath(v:progpath)
--\ . ' --servername ' . v:servername
--\ . ' --remote-send \"^<C-\^>^<C-n^>'
--\ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
--\ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
--\ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
