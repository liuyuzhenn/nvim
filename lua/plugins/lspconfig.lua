return {
	"git@github.com:neovim/nvim-lspconfig.git",
	config = function()
		local status, lspconfig = pcall(require, "lspconfig")
		if not status then
			return
		end

		local util = lspconfig.util

		-- key mappings
		local opts = { noremap = true, silent = true }

		local on_attach = function(client, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set("i", "<A-k>", vim.lsp.buf.signature_help, bufopts)
			vim.cmd([[
		augroup Format
		autocmd! * <buffer>
		autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
		augroup end
	]])
		end

		local lsp_flags = {
			-- This is the default in Nvim 0.7+
			debounce_text_changes = 150,
		}

		lspconfig.pyright.setup({
			-- root_dir = util.find_git_ancestor,
			root_dir = function(fname)
				local root_files = {
					'pyproject.toml',
					'setup.py',
					'setup.cfg',
					'requirements.txt',
					'Pipfile',
					'pyrightconfig.json',
				}
				return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
			end,
			on_attach = on_attach,
			flags = lsp_flags,
			settings = {
				include = { "${workspaceFolder}" },
				python = {
					analysis = {
						diagnosticSeverityOverrides = {
							reportUnboundVariable = "information",
							reportGeneralTypeIssues = "none",
							reportOptionalCall = "warning",
							reportImplicitStringConcatenation = "warning",
						},
					},
				},
			},
		})

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostic = { globals = { "vim" } },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
			},
		})

		lspconfig.cmake.setup({
			on_attach = on_attach,
			flags = lsp_flags,
		})

		lspconfig.texlab.setup({
			on_attach = on_attach,
			flags = lsp_flags,
			root_dir = util.root_pattern("*.tex"),
			cmd = { "texlab" },
		})

		lspconfig.vimls.setup({
			on_attach = on_attach,
			cmd = { "vim-language-server", "--stdio" },
			diagnostic = {
				enable = true,
			},
			indexes = {
				count = 3,
				gap = 100,
				projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
				runtimepath = true,
			},
			isNeovim = true,
			iskeyword = "@,48-57,_,192-255,-#",
			runtimepath = "",
			suggest = {
				fromRuntimepath = true,
				fromVimruntime = true,
			},
			vimruntime = "",
		})

		lspconfig.marksman.setup({
			on_attach = on_attach,
			flags = lsp_flags,
		})

		lspconfig.clangd.setup({
			on_attach = on_attach,
		})

		lspconfig.html.setup({
			on_attach = on_attach,
		})

		lspconfig.bashls.setup({
			on_attach = on_attach,
			flags = lsp_flags,
		})

		lspconfig.yamlls.setup({
			on_attach = on_attach,
			flags = lsp_flags,
		})

		lspconfig.jsonls.setup({
			on_attach = on_attach,
			flags = lsp_flags,
		})

		local signs = { Error = "", Warn = "", Hint = "", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
