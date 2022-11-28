local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
	return
end

local ok, rule = pcall(require, "nvim-autopairs.rule")
if not ok then
	return
end

-- you can use some built-in conditions
npairs.setup({
	disable_filetype = { "TelescopePrompt" },
	disable_in_macro = false,
	disable_in_visualblock = false,
	disable_in_replace_mode = true,
	ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
	enable_moveright = true,
	enable_afterquote = true,
	enable_check_bracket_line = true,
	enable_bracket_in_quote = true,
	enable_abbr = false,
	break_undo = true,
	check_ts = false,
	map_cr = true,
	map_bs = true,
	map_c_h = false,
	map_c_w = false,
})
