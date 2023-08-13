return {
	"git@github.com:iamcco/markdown-preview.nvim.git",
	build = "cd app && npm install",
	ft = "markdown",
	lazy = true,
	keys = { { "<F9>", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
	config = function()
		vim.g.mkdp_auto_start = false
		vim.g.mkdp_auto_clse = true
		vim.g.mkdp_open_to_the_world = true
		vim.g.mkdp_browser = 'firefox'
		vim.g.mkdp_echo_preview_url = true
		vim.g.mkdp_filetypes = { 'markdown', 'text' }
	end
}
