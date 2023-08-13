return {
	"git@github.com:kylechui/nvim-surround.git",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end
}
