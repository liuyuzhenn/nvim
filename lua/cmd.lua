local function CMakeGenerate()
	vim.cmd("!cmake -B build")
end

local function CMakeBuild()
	vim.cmd("!cmake --build build")
end

vim.api.nvim_create_user_command("CMakeGenerate", CMakeGenerate, { nargs = 0 })
vim.api.nvim_create_user_command("CMakeBuild", CMakeBuild, { nargs = 0 })

vim.api.nvim_set_keymap("n", "<leader>gg", "<Cmd>CMakeGenerate<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>gb", "<Cmd>CMakeBuild<CR>", { silent = true })

vim.cmd([[
augroup _general
	autocmd!
	autocmd FileType * setlocal nowrap
	autocmd FileType markdown,tex,txt,plaintex setlocal wrap
	autocmd FileType  * setlocal tabstop=4 shiftwidth=4
	autocmd FileType c,cpp,json,lua,vim,tex,html,yaml setlocal tabstop=2 shiftwidth=2
augroup end

augroup _fold_bug_solution
	autocmd!
	autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
augroup end

]])

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 180,
		})
	end,
})
