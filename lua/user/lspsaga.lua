local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

local keymap = vim.keymap.set

saga.init_lsp_saga()

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>aa", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this floatwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
--keymap("n", "[E", function()
--require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
--end, { silent = true })
--keymap("n", "]E", function()
--require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
--end, { silent = true })


-- Float terminal
--keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
--keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
--keymap("t", "<leader>e", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
