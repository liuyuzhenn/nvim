local function CMakeGenerate()
	vim.cmd("!cmake -B build")
end

local function CMakeBuild()
	vim.cmd("!cmake --build build")
end

vim.api.nvim_create_user_command("CMakeGenerate", CMakeGenerate, { nargs = 0 })
vim.api.nvim_create_user_command("CMakeBuild", CMakeBuild, { nargs = 0 })
