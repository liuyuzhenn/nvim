return {
	"git@github.com:anuvyklack/pretty-fold.nvim.git",
	config = function()
		local status, fold = pcall(require, "pretty-fold")
		if not status then
			return
		end

		local config = {
			sections = {
				left = {
					--'content'
					function(config)
						return config.fill_char:rep(4)
					end,
					" ",
					"number_of_folded_lines",
					": ",
					"percentage",
					" ",
					--function(config) return config.fill_char:rep(3) end
				},
				right = {},
			},
			fill_char = "─",

			remove_fold_markers = true,

			-- Keep the indentation of the content of the fold string.
			keep_indentation = true,

			-- Possible values:
			-- "delete" : Delete all comment signs from the fold string.
			-- "spaces" : Replace all comment signs with equal number of spaces.
			-- false    : Do nothing with comment signs.
			process_comment_signs = "spaces",

			-- Comment signs additional to the value of `&commentstring` option.
			comment_signs = {},

			-- List of patterns that will be removed from content foldtext section.
			stop_words = {
				"@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
			},

			add_close_pattern = true, -- true, 'last_line' or false

			matchup_patterns = {
				{ "{", "}" },
				{ "%(", ")" }, -- % to escape lua pattern char
				{ "%[", "]" }, -- % to escape lua pattern char
			},

			ft_ignore = { "neorg" },
		}

		fold.setup(config)

		fold.ft_setup("lua", {
			matchup_patterns = {
				{ "^%s*do$", "end" }, -- do ... end blocks
				{ "^%s*if", "end" }, -- if ... end
				{ "^%s*for", "end" }, -- for
				{ "function%s*%(", "end" }, -- 'function( or 'function (''
				{ "{", "}" },
				{ "%(", ")" }, -- % to escape lua pattern char
				{ "%[", "]" }, -- % to escape lua pattern char
			},
		})

		require("pretty-fold").ft_setup("cpp", {
			process_comment_signs = false,
			comment_signs = {
				"/**", -- C++ Doxygen comments
			},
			stop_words = {
				-- ╟─ "*" ──╭───────╮── "@brief" ──╭───────╮──╢
				--          ╰─ WSP ─╯              ╰─ WSP ─╯
				"%*%s*@brief%s*",
			},
		})

	end
}
