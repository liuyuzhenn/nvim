local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

-- key mappings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
--vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- use Lspsaga instead
--vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	--vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	--vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("i", "<A-k>", vim.lsp.buf.signature_help, bufopts)
	--vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	--vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	--vim.keymap.set("n", "<space>wl", function()
	--print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--end, bufopts)
	--vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	--vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, bufopts)
	--vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	--vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	--vim.keymap.set("n", "<space>f", function()
	--vim.lsp.buf.format({ async = true })
	--end, bufopts)

	--autocmd BufWritePre <buffer> lua vim.lsp.buf.format( {async=true} )
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
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		include = { "${workspaceFolder}" },
		python = {
			analysis = {
				autoImportCompletions = false,
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

lspconfig.texlab.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	cmd = { "texlab.cmd" },
})

lspconfig.marksman.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	cmd = { "marksman.cmd" },
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	cmd = { "clangd.cmd" },
})

lspconfig.html.setup({
	on_attach = on_attach,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	--cmd = { "vscode-css-language-server.cmd" },
})

lspconfig.cmake.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	cmd = { "cmake-language-server.cmd" },
})

lspconfig.vimls.setup({
	on_attach = on_attach,
	cmd = { "vim-language-server.cmd", "--stdio" },
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.jsonls.setup({
	capabilities = capabilities,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
