return {
	"git@github.com:norcalli/nvim-colorizer.lua.git",
	config = function()
		local status_ok, colorizer = pcall(require, "colorizer")
		if not status_ok then
			return
		end
		colorizer.setup()
	end,
}
