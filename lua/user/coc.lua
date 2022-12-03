--vim.cmd(
--[[
	" COC
	set nobackup
	set nowritebackup
	set updatetime=300
	set signcolumn=yes

	" highlight CocFloating ctermbg=2 ctermfg=1
	inoremap <silent><expr><C-j> coc#pum#visible() ? coc#pum#next(0) : "\<C-j>"
	inoremap <silent><expr><C-k> coc#pum#visible() ? coc#pum#prev(0) : "\<C-k>"
	nnoremap <silent><expr><C-j> coc#pum#visible() ? coc#pum#next(0) : "\<C-j>"
	nnoremap <silent><expr><C-k> coc#pum#visible() ? coc#pum#prev(0) : "\<C-k>"
	
	" use Tab to trigger completion
	inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
	
	function! CheckBackspace() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	hi CocMenuSel ctermbg=237 guibg=#13354A
	
	" Use <c-space> to trigger completion.
	if has('nvim')
	  inoremap <silent><expr> <c-space> coc#refresh()
	else
	  inoremap <silent><expr> <c-@> coc#refresh()
	endif
	
	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
	nmap <silent> g[ <Plug>(coc-diagnostic-prev)
	nmap <silent> g] <Plug>(coc-diagnostic-next)
	
	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	
	" Use K to show documentation in preview window.
	nnoremap <silent> K :call ShowDocumentation()<CR>
	
	function! ShowDocumentation()
	  if CocAction('hasProvider', 'hover')
	    call CocActionAsync('doHover')
	  else
	    call feedkeys('K', 'in')
	  endif
	endfunction
	
	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')
	
	" Symbol renaming.
	nmap <leader>r <Plug>(coc-rename)

	"hi CocHintFloat guibg=#AFD787 guifg=#FF7AA3 ctermbg=2 ctermfg=1
	let g:coc_status_error_sign='✗'
	let g:coc_status_warning_sign='⚡'

--]]
--)
if vim.g.vscode ~= nil then
	return
end


--hi CocMenuSel guibg=#13354A guifg=#EFE0CA
--vim.api.nvim_command([[
	--hi CocHintFloat guibg=#AFD787 guifg=#1F7AA3
	--hi CocSearch ctermfg=12 guifg=#18A3FF
  --hi CocMenuSel guibg=#494F58
--]])


-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Auto complete
function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(0) : "\<C-k>"]], opts)
keyset("i", "<C-j>", [[coc#pum#visible() ? coc#pum#next(0) : "\<C-j>"]], opts)
keyset("i", "<C-e>", [[coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"]], opts)
keyset("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"]], opts)
--keyset("i", "<C-w>", "<Plug>(coc-snippets-expand-jump)")
--
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation.
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

-- preview definition
keyset("n", "<leader>gd", ":call CocAction('jumpDefinition', 'vsplit')<CR>", { silent = true, nowait = true })

-- Use K to show documentation in preview window.
function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end
keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
	group = "CocGroup",
	command = "silent call CocActionAsync('highlight')",
	desc = "Highlight symbol under cursor on CursorHold",
})

-- Symbol renaming.
keyset("n", "<leader>r", "<Plug>(coc-rename)", { silent = true })

-- Formatting selected code.
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

-- Setup formatexpr specified filetype(s).
vim.api.nvim_create_autocmd("FileType", {
	group = "CocGroup",
	pattern = "typescript,json",
	command = "setl formatexpr=CocAction('formatSelected')",
	desc = "Setup formatexpr specified filetype(s).",
})

-- Update signature help on jump placeholder.
vim.api.nvim_create_autocmd("User", {
	group = "CocGroup",
	pattern = "CocJumpPlaceholder",
	command = "call CocActionAsync('showSignatureHelp')",
	desc = "Update signature help on jump placeholder",
})

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
opts = { silent = true, nowait = true }
keyset("v", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for applying codeAction to the current buffer.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)

-- Apply AutoFix to problem on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Run the Code Lens action on the current line.
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

local opts = { silent = true, nowait = true, expr = true }
keyset({ "n", "i", "v" }, "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
keyset({ "n", "i", "v" }, "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
--keyset({"n", "i", "v"}, "<C-u>", 'coc#pum#visible() ? coc#pum#scroll(0) : "<C-u>"', opts)

vim.g.coc_status_error_sign = "✗"
vim.g.coc_status_warning_sign = "⚡"
-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = "?" })

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
-- Show all diagnostics.
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions.
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands.
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document.
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Do default action for next item.
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item.
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list.
--keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)
-- conflict with markdown preview command
