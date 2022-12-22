local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
local directions = require('hop.hint').HintDirection

-- replace default neovim mapping
vim.keymap.set({ "n" }, 'f', function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set({ "n" }, 'F', function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set({ "n", "v" }, '<leader>s', '<Cmd>HopChar2<CR>', { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, '<leader>j', '<Cmd>HopLine<CR>', { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, '<leader>w', '<Cmd>HopWord<CR>', { silent = true, noremap = true })

hop.setup {
	quit_key = '<leader>',
	jump_on_sole_occurrence = false,
	create_hl_autocmd = true,
	multi_windows = false,
}
