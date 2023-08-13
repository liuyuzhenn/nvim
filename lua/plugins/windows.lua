return {
	"git@github.com:anuvyklack/windows.nvim.git",
	dependencies = {
		"git@github.com:anuvyklack/middleclass.git",
		"git@github.com:anuvyklack/animation.nvim.git"
	},
	config = function()
		local status, windows = pcall(require, "windows")

		if not status then
			return
		end
		require("middleclass")
		-- local status, animation = pcall(require, "animation")
		local function cmd(command)
			return table.concat({ '<Cmd>', command, '<CR>' })
		end

		windows.setup({})
		vim.o.winwidth = 5
		vim.o.winminwidth = 5
		vim.o.equalalways = false
		vim.keymap.set('n', '<leader>m', cmd 'WindowsMaximize')
		vim.keymap.set('n', '<leader>\\', cmd 'WindowsMaximizeVertically')
		vim.keymap.set('n', '<leader>-', cmd 'WindowsMaximizeHorizontally')
		vim.keymap.set('n', '<leader>=', cmd 'WindowsEqualize')
		vim.keymap.set('n', '<leader>p', cmd 'WindowsToggleAutowidth')
	end
}
