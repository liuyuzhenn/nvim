local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

local ok, util = pcall(require, "formatter.util")
if not ok then
	return
end

-- Utilities for creating configurations

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = { require("formatter.filetypes.lua").stylua },
		python = { require("formatter.filetypes.python").autopep8 },
		cpp = { require("formatter.filetypes.cpp").clangformat },
		-- Use the special "*" filetype for defining formatter configurations on any filetype
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<leader>F", ":Format<CR>", { silent = true, noremap = true })
