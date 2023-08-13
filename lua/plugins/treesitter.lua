return {
	"git@github.com:nvim-treesitter/nvim-treesitter.git",
	build = ":TSUpdate",
	config = function()
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup {
			-- A list of parser names, or "all"
			ensure_installed = {
				"python",
				"cpp",
				"c",
				"lua"
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			auto_install = true,

			-- List of parsers to ignore installing (for "all")
			ignore_install = {
				"latex",
				"cpp",
			},


			highlight = {
				-- `false` will disable the whole extension
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
	end
}
