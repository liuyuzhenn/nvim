vim.cmd [[
augroup _general
	autocmd!
	autocmd FileType * setlocal nowrap
	autocmd FileType markdown,tex,txt,plaintex setlocal wrap
	autocmd FileType  * setlocal tabstop=4 shiftwidth=4
	autocmd FileType json,lua,vim setlocal tabstop=2 shiftwidth=2
augroup end

augroup _fold_bug_solution
	autocmd!
	autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
augroup end

]]

