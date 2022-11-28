vim.cmd[[
augroup _general
	autocmd!
	autocmd FileType markdown,tex,plaintex setlocal wrap
	autocmd BufWritePre *.lua,*.json,*.vim setlocal tabstop=2 shiftwidth=2
	autocmd BufEnter *.lua,*.json,*.vim setlocal tabstop=2 shiftwidth=2
augroup end

augroup _fold_bug_solution
	autocmd!
	autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
augroup end

]]

