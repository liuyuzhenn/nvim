return {
	"git@github.com:L3MON4D3/LuaSnip.git",
	build = "make install_jsregexp",
	config = function()
		local status, ls = pcall(require, "luasnip")
		if not status then
			return
		end

		ls.setup({
			update_events = "TextChanged,TextChangedI",
			store_selection_keys = "<Tab>",
			enable_autosnippets = true,
		})

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		keymap("i", "<C-h>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", opts)
		keymap("i", "<C-l>", "<cmd>lua require'luasnip'.jump(1)<Cr>", opts)
		keymap("s", "<C-h>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", opts)
		keymap("s", "<C-l>", "<cmd>lua require'luasnip'.jump(1)<Cr>", opts)

		--inoremap <c-s> <cmd>lua require("luasnip.extras.select_choice")()<cr>
		vim.keymap.set(
			"n",
			"<Leader>L",
			'<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets"})<CR>'
		)

		vim.cmd([[
imap <silent><expr> <C-s> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-e>'
smap <silent><expr> <C-s> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-e>'
smap <silent><expr> <C-q> luasnip#choice_active() ? '<cmd>lua require("luasnip.extras.select_choice")()<cr>' : '<C-s>'
imap <silent><expr> <C-q> luasnip#choice_active() ? '<cmd>lua require("luasnip.extras.select_choice")()<cr>' : '<C-s>'
"imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
imap <silent><expr> <C-w> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<C-w>'
]])

		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

		ls.filetype_extend("zsh", { "sh", "zsh" })

	end
}
