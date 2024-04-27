local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local nrmp = { noremap = true }

-- NEW FEATURES
map({'n', 'i', 'x'}, '<C-S>', '<CMD>update<CR>', opts)
map('n', '<C-J>', '<CMD>bprevious<CR>', opts)
map('n', '<C-K>', '<CMD>bnext<CR>', opts)
map('x', '<S-K>', ':m \'<-2<CR>gv', opts)
map('x', '<S-J>', ':m \'>+1<CR>gv', opts)

-- IMPROVED FEATURES
map('i', '<C-C>', '<esc>', opts)
map('n', 'J', function() local cursor = vim.api.nvim_win_get_cursor(0) vim.cmd('join') vim.api.nvim_win_set_cursor(0, cursor) end, opts)
map('x', 'p', '"_dP', opts)
map('n', '<C-U>', '<C-U>zz', opts)
map('n', '<C-D>', '<C-D>zz', opts)
map('n', '<C-F>', '<C-F>zz', opts)
map('n', '<C-B>', '<C-B>zz', opts)
map('x', '>', '>gvl', opts)
map('x', '<', '<gvh', opts)
map('n', 'N', 'Nzz', opts)
map('n', 'n', 'nzz', opts)
map('n', '<C-Z>', '<C-A>', opts)
map('v', '<C-Z>', '<C-A>', opts)
map('x', 'g<C-Z>', 'g<C-A>', opts)
map('n', '<UP>', 'gk', opts)
map('n', '<DOWN>', 'gj', opts)

-- LEADER KEYMAPS
-- a b c d e f g h i j k l m n o p q r s t u v w x y z æ ø å 1 2 3 4 5 6 7 8 9 0
--   •   •   •   • •             •   • • •         •         • • • • • • • • • •

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- b (Buffer)
	map('n', '<leader>bd', '<CMD>bdel<CR>', opts)
	map('n', '<leader>bD', '<CMD>bdel!<CR>', opts)
-- d (Delete)
	map('n', '<leader>d', '"_d', opts)
	map('x', '<leader>d', '"_d', opts)
-- f (Find)
	map('n', '<leader>f', '/', nrmp)
	map('n', '<leader>F', '?', nrmp)
-- h (Harpoon)
	local keybinds = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
	map('n', '<leader>0', '<CMD>HarpoonPrint<CR>', opts)
	map('n', '<leader>hD', '<CMD>HarpoonDeleteAll<CR>', opts)
	for _, value in pairs(keybinds) do
		map('n', '<leader>' .. value, '<CMD>HarpoonSwitch ' .. value .. '<CR>', opts)
		map('n', '<leader>h' .. value, '<CMD>HarpoonDefine ' .. value .. '<CR>', opts)
		map('n', '<leader>hd' .. value, '<CMD>HarpoonDelete ' .. value .. '<CR>', opts)
	end
-- i (Inspect)
	map('n', '<leader>i', '<CMD>Inspect<CR>', nrmp)
-- p (Paste system clipboard)
	map('x', '<leader>p', '"_d"+P', opts)
	map('n', '<leader>p', '"+p', opts)
-- r (Replace Substitute)
	map('n', '<leader>r', ':%s/', nrmp)
	map('x', '<leader>r', ':s/', nrmp)
-- s (Search Telescope)
	map('n', '<leader>st', '<CMD>Telescope<CR>', opts)
	map('n', '<leader>sp', '<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>', opts)
	-- map('n', '<leader>sp', '<CMD>ToggleNetRW<CR>', opts)
	map('n', '<leader>sf', '<CMD>Telescope find_files<CR>', opts)
	map('n', '<leader>sc', '<CMD>lua require("telescope.builtin").find_files({ prompt_title = "NeoVim Configuration", cwd = vim.fn.stdpath("config") })<CR>', opts)
	map('n', '<leader>sb', '<CMD>Telescope buffers<CR>', opts)
	map('n', '<leader>sd', '<CMD>Telescope diagnostics<CR>', opts)
	map('n', '<leader>sh', '<CMD>Telescope help_tags<CR>', opts)
	map('n', '<leader>su', '<CMD>Telescope undo<CR>', opts)
	map('n', '<leader>s/', '<CMD>Telescope current_buffer_fuzzy_find<CR>', opts)
-- t (Toggle)
	map('n', '<leader>tw', '<CMD>set wrap!<CR>', opts)
	map('n', '<leader>ti', '<CMD>set list!<CR>', opts)
	map('n', '<leader>tf', '<CMD>ToggleFoldcolumn<CR>', opts)
	map('n', '<leader>tc', '<CMD>set cursorline!<CR>', opts)
	map('n', '<leader>tn', '<CMD>set rnu!<CR>', opts)
	map('n', '<leader>tl', '<CMD>ToggleLanguage<CR>', opts)
-- y (Yank system clipboard)
	map('x', '<leader>y', '"+y', opts)
