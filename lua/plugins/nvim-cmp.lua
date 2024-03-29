return {
	"git@github.com:hrsh7th/nvim-cmp.git",
	dependencies = {
		"git@github.com:hrsh7th/cmp-nvim-lsp.git",
		"git@github.com:hrsh7th/cmp-nvim-lua.git",
		"git@github.com:rcarriga/cmp-dap.git",
		"git@github.com:hrsh7th/cmp-buffer.git",
		"git@github.com:hrsh7th/cmp-path.git",
		"git@github.com:hrsh7th/cmp-cmdline.git",
		"git@github.com:saadparwaiz1/cmp_luasnip",
		"git@github.com:L3MON4D3/LuaSnip.git",
	},
	config = function()
		local status, cmp = pcall(require, "cmp")
		if not status then
			return
		end
		local lspkind = require("lspkind")

		cmp.setup({
			preselect = cmp.PreselectMode.None,
			enabled = function()
				return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
			end,
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-8), { "i", "c" }),
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(8), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(
					cmp.mapping.complete({
						config = {
							sources = { { name = "luasnip" } },
						},
					}),
					{ "i", "c" }
				),
				["<C-E>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
				["<Tab>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
			}),
			sources = cmp.config.sources({
				{
					name = "path",
					option = {
						get_cwd = function()
							return vim.fn['getcwd']()
						end
					},
				},
				{ name = "omni" },
				{ name = "nvim_lsp", keyword_length = 2 },
				{ name = "luasnip" },
				{ name = "buffer" },
			}),
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
			sources = {
				{ name = "dap" },
			},
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline", keyword_pattern = [=[[^[:blank:]\!]*]=], keyword_length = 4 },
			}),
		})

	end

}
