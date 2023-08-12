local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
	return
end

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

local handlers = require("nvim-autopairs.completion.handlers")

cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done({
		filetypes = {
			-- "*" is a alias to all filetypes
			["*"] = {
				["("] = {
					kind = {
						-- "*",
						cmp.lsp.CompletionItemKind.Function,
						cmp.lsp.CompletionItemKind.Method,
						cmp.lsp.CompletionItemKind.Class,
					},
					handler = handlers["*"],
				},
			},
			-- Disable for tex
			tex = false,
		},
	})
)
