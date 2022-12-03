local status_ok, bf = pcall(require, "bufferline")
if not status_ok then
	return
end

bf.setup({
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		--numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		--- @deprecated, please specify numbers as a function to customize the styling
		--number_style = "subscript", --| "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		indicator = {
			--icon = "▎"
			--style = "underline",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
			-- remove extension from markdown files for example
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 4,
		diagnostics = false, --| "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } }, -- | function , text_align = "left" | "center" | "right"}},
		show_buffer_icons = true, --| false, -- disable filetype icons for buffers
		show_buffer_close_icons = false, --| false,
		show_close_icon = false, --| false,
		show_tab_indicators = true, -- | false,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "slant", --| "slant" | "thick" | "thin" | { 'any', 'any' },
		--separator_style = { '', '' },
		enforce_regular_tabs = false, --| true,
		always_show_bufferline = false, -- | false,
		sort_by = "id", -- ,'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
		--   -- add custom logic
		--   return buffer_a.modified > buffer_b.modified
		-- end
	},
	highlights = {
		separator_selected = {
			--bg = "#565049",
		},
		--duplicate_selected = { bg = "#565049" },

		indicator_selected = {
			--bg = "#565049"
			underline = false,
			underdoule = false,
			bold = true,
		},
		--tab_selected = { bg = "#565049" },
		--pick_selected = { bg = "#565049" },
		--modified_selected = {
		----bg = "#43505B",
		--bg = "#565049",
		--},
		buffer_selected = {
			fg = "#fd971f", -- for deus
			--underline = true,
			bold = true,
			italic = false,
		},
		separator = {},
		fill = {},
	},
})

vim.keymap.set({ "n", "i" }, "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { silent = true })
