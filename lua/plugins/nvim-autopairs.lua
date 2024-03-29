return {
	'git@github.com:windwp/nvim-autopairs.git',
	event = "InsertEnter",
	config = function()
		local ok, npairs = pcall(require, "nvim-autopairs")
		if not ok then
			return
		end

		-- If you want insert `(` after select function or method item
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		local cmp = require('cmp')


		local handlers = require('nvim-autopairs.completion.handlers')

		cmp.event:on(
			'confirm_done',
			cmp_autopairs.on_confirm_done({
				filetypes = {
					-- "*" is a alias to all filetypes
					["*"] = {
						["("] = {
							kind = {
								cmp.lsp.CompletionItemKind.Function,
								cmp.lsp.CompletionItemKind.Method,
								cmp.lsp.CompletionItemKind.Class,
							},
							handler = handlers["*"]
						}
					},
					-- Disable for tex
					tex = false
				}
			})
		)

		-- you can use some built-in conditions
		npairs.setup({
			disable_filetype = { "TelescopePrompt" },
			disable_in_macro = false,
			disable_in_visualblock = false,
			disable_in_replace_mode = true,
			ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
			enable_moveright = true,
			enable_afterquote = true,
			enable_check_bracket_line = true,
			enable_bracket_in_quote = true,
			enable_abbr = false,
			break_undo = true,
			check_ts = false,
			map_cr = true,
			map_bs = true,
			map_c_h = false,
			map_c_w = false,
		})

	end
}
