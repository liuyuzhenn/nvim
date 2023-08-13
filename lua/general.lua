vim.g.encoding = "utf-8"

vim.cmd [[
filetype on
filetype plugin on
syntax on
set termguicolors
colorscheme monokai_soda
set background=dark
set nobackup
]]

local opt = vim.opt

-- vim.g.clipboard = {
-- 	name = 'win32yank',
-- 	copy = {
-- 		["+"] = 'win32yank.exe -i --crlf',
-- 		["*"] = 'win32yank.exe -i --crlf',
-- 	},
-- 	paste = {
-- 		["+"] = 'win32yank.exe -o --lf',
-- 		["*"] = 'win32yank.exe -o --lf',
-- 	},
-- 	cache_enabled = 0,
-- }
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.foldmethod = "indent"
opt.foldminlines = 5
opt.foldlevel = 9999
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.shiftwidth = 4
opt.wrap = false


local function cmd(command)
	return table.concat({ '<Cmd>', command, '<CR>' })
end

local keymap = vim.keymap.set

keymap('n', '<A-d>', cmd 'Bdelete')
keymap('n', '<C-s>', 'xi')
keymap('n', 'S', ':w<CR>')
keymap('n', 'Q', ':q<CR>')
keymap('n', ';', ':')
keymap('n', '<C-j>', '<C-w>j', { noremap = true })
keymap('n', '<C-k>', '<C-w>k', { noremap = true })
keymap('n', '<C-h>', '<C-w>h', { noremap = true })
keymap('n', '<C-l>', '<C-w>l', { noremap = true })
keymap('n', '<C-n>', ':noh<CR>', { noremap = true, silent = true })
keymap('n', 'sl', ':set splitright<CR>:vsplit<CR>', { noremap = true, silent = true })
keymap('n', 'sh', ':set nosplitright<CR>:vsplit<CR>', { noremap = true, silent = true })
keymap('n', 'sk', ':set nosplitbelow<CR>:split<CR>', { noremap = true, silent = true })
keymap('n', 'sj', ':set splitbelow<CR>:split<CR>', { noremap = true, silent = true })
keymap('n', '<S-tab>', cmd 'bN', { noremap = true, silent = true })
keymap('n', '<tab>', cmd 'bn', { noremap = true, silent = true })
keymap({ 'n', 'v' }, 'H', '^')
keymap({ 'n', 'v' }, 'L', '$')
keymap('n', 'yl', 'y$')
keymap('n', 'yh', 'y^')
keymap('n', 'dh', 'd^')
keymap('n', 'dl', 'd$')
keymap('n', 'ch', 'c^')
keymap('n', 'cl', 'c$')
keymap('n', 'dii', "di'")
keymap('n', 'diI', 'di"')
keymap('n', 'cii', "cii")
keymap('n', 'ciI', 'ci"')
keymap('n', 'yii', "yii")
keymap('n', 'yiI', 'yi"')
keymap('n', 'ZZ', ':wa<CR>:qa<CR>', { noremap = true })
keymap('n', '<leader>n', ':noh<CR>', { noremap = true, silent = true })
keymap('n', '<up>', ":res +3<CR>", { noremap = true, silent = true })
keymap('n', '<down>', ":res -3<CR>", { noremap = true, silent = true })
keymap('n', '<left>', ":vertical res -3<CR>", { noremap = true, silent = true })
keymap('n', '<right>', ":vertical res +3<CR>", { noremap = true, silent = true })
keymap('n', 'J', "<nop>", { noremap = true, silent = true })
