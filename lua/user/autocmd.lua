vim.cmd [[
augroup _general
	autocmd!
	autocmd FileType * setlocal nowrap
	autocmd FileType markdown,tex,txt,plaintex setlocal wrap spell
	autocmd FileType  * setlocal tabstop=4 shiftwidth=4
	autocmd FileType c,cpp,json,lua,vim,tex setlocal tabstop=2 shiftwidth=2
augroup end

augroup _fold_bug_solution
	autocmd!
	autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
augroup end

]]


vim.api.nvim_create_autocmd(
	'TextYankPost',
	{
		callback = function()
			vim.highlight.on_yank {
				higroup = 'IncSearch',
				timeout = 180
			}
		end
	}
)
