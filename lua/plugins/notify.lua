return {
	'git@github.com:rcarriga/nvim-notify.git',
	config = function()
		local status, notify = pcall(require, "notify")
		if not status then
			return
		end

		notify.setup({
			background_colour = "Normal",
			fps = 30,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2, -- DEBUG ERROR INFO TRACE WARN
			minimum_width = 50,
			render = "default",
			stages = "fade_in_slide_out",
			timeout = 1500,
			top_down = true,
		})

		local banned_messages = {
			"[LSP] Format request failed, no matching language servers.",
		}

		vim.notify = function(msg, ...)
			for _, banned in ipairs(banned_messages) do
				if msg == banned then
					return
				end
			end
			notify(msg, ...)
		end

	end
}
