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
imap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-e>'
smap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-e>'
smap <silent><expr> <C-s> luasnip#choice_active() ? '<cmd>lua require("luasnip.extras.select_choice")()<cr>' : '<C-s>'
imap <silent><expr> <C-s> luasnip#choice_active() ? '<cmd>lua require("luasnip.extras.select_choice")()<cr>' : '<C-s>'
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


local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local fmt = require('luasnip.extras.fmt').fmt
local types = require("luasnip.util.types")
local function node_with_virtual_text(pos, node, text)
	local nodes
	if node.type == types.textNode then
		node.pos = 2
		nodes = { i(1), node }
	else
		node.pos = 1
		nodes = { node }
	end
	return sn(pos, nodes, {
		node_ext_opts = {
			active = {
				-- override highlight here ("GruvboxOrange").
				virt_text = { { text, "GruvboxOrange" } }
			}
		}
	})
end

local function nodes_with_virtual_text(nodes, opts)
	if opts == nil then
		opts = {}
	end
	local new_nodes = {}
	for pos, node in ipairs(nodes) do
		if opts.texts[pos] ~= nil then
			node = node_with_virtual_text(pos, node, opts.texts[pos])
		end
		table.insert(new_nodes, node)
	end
	return new_nodes
end

local function choice_text_node(pos, choices, opts)
	choices = nodes_with_virtual_text(choices, opts)
	return c(pos, choices, opts)
end

local ct = choice_text_node
ls.add_snippets("python", {
	s('d', fmt([[
		def {func}({args}){ret}:
			{doc}{body}
	]], {
		func = i(1),
		args = i(2),
		ret = c(3, {
			t(''),
			sn(nil, {
				t(' -> '),
				i(1),
			}),
		}),
		doc = isn(4, { ct(1, {
			t(''),
			-- NOTE we need to surround the `fmt` with `sn` to make this work
			sn(1, fmt([[
			"""{desc}"""

			]], { desc = i(1) })),
			sn(2, fmt([[
			"""{desc}

			Args:
			{args}

			Returns:
			{returns}
			"""

			]], {
				desc = i(1),
				args = i(2), -- TODO should read from the args in the function
				returns = i(3),
			})),
		}, {
			texts = {
				"(no docstring)",
				"(single line docstring)",
				"(full docstring)",
			}
		}) }, "$PARENT_INDENT\t"),
		body = i(0),
	}))
})
