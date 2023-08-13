return {
	"git@github.com:glepnir/dashboard-nvim.git",
	config = function()
		local status_ok, db = pcall(require, "dashboard")
		if not status_ok then
			return
		end

		vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = "#99ff99" })
		-- vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = "#ffffff", bg = "#333333" })

		local header = {
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
			[[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
			[[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
			[[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
			[[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
			[[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
			[[]],
			[[]],
		}

		db.setup({
			theme = 'doom',
			config = {
				header = header, --your header
				center = {
					{ icon = '  ',
						icon_hl = 'Title',
						desc = 'Find  File                       ',
						desc_hl = 'String',
						action = 'Telescope find_files find_command=find',
						keymap = 'SPC f f',
						key = 'f',
						key_hl = 'Number',
					},
					{ icon = '  ',
						icon_hl = 'Title',
						desc = 'File Browser                     ',
						desc_hl = 'String',
						action = 'Telescope file_browser',
						keymap = 'SPC f b',
						key = 'b',
						key_hl = 'Number',
					},
					{ icon = '  ',
						icon_hl = 'Title',
						desc = 'Find  word                       ',
						desc_hl = 'String',
						action = 'Telescope live_grep',
						keymap = 'SPC f g',
						key = 'g',
						key_hl = 'Number',
					},
				},
				footer = { '🌱🌱🌱' } --your footer
			}
		})

		-- vim.cmd([[
		-- hi link DashboardHeader Label
		-- hi link DashboardCenter Identifier
		-- hi link DashboardShortCut String
		-- hi link DashboardFooter Comment
		-- ]])

	end
}
