local status, ls = pcall(require, 'luasnip')
if not status then
	return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("i", "<C-h>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", opts)
keymap("i", "<C-l>", "<cmd>lua require'luasnip'.jump(1)<Cr>", opts)
keymap("s", "<C-h>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", opts)
keymap("s", "<C-l>", "<cmd>lua require'luasnip'.jump(1)<Cr>", opts)

--inoremap <c-s> <cmd>lua require("luasnip.extras.select_choice")()<cr>


vim.cmd [[
imap <silent><expr> <C-s> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-e>'
smap <silent><expr> <C-s> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-e>'
smap <silent><expr> <C-q> luasnip#choice_active() ? '<cmd>lua require("luasnip.extras.select_choice")()<cr>' : '<C-s>'
imap <silent><expr> <C-q> luasnip#choice_active() ? '<cmd>lua require("luasnip.extras.select_choice")()<cr>' : '<C-s>'
"imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
imap <silent><expr> <C-w> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<C-w>'
]]


--local s = ls.snippet
--local i = ls.insert_node
--local t = ls.text_node

--ls.add_snippets("lua", { s("trigger", {
--t({ "After expanding, the cursor is here ->" }), i(1),
--t({ "", "After jumping forward once, cursor is here ->" }), i(2),
--t({ "", "After jumping once more, the snippet is exited there ->" }), i(0),
--}) })

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

--" press <Tab> to expand or jump in a snippet. These can also be mapped separately
--" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
--imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
--" -1 for jumping backwards.
--inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

--snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
--snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
