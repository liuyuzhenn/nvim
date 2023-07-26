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
	timeout = 3000,
	top_down = true,
})


local band_messages = {
	"[LSP] Format request failed, no matching language servers.",
}
vim.notify = function(message, ...)
	for _, banded in pairs(band_messages) do
		if message == banded then
			return
		end
	end
	notify(message, ...)
end
