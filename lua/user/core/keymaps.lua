local map = vim.keymap.set

-- NEW FEATURES
	map({'n', 'i', 'x'}, '<C-S>', '<CMD>w<CR>')
	map('n', '<C-J>', '<CMD>bprevious<CR>')
	map('n', '<C-K>', '<CMD>bnext<CR>')
	map('x', '<S-J>', ':m \'>+1<cr>gv')
	map('x', '<S-K>', ':m \'<-2<cr>gv')
	map('i', '<C-H>', '<CMD>lua vim.lsp.buf.signature_help()<CR>')

-- IMPROVED FEATURES
	map('i', '<C-C>', '<ESC>')
	map('n', 'q', '<nop>')
	map('n', 'J',
		function()
			local count = vim.v.count1
			local cursor = vim.api.nvim_win_get_cursor(0)
			vim.api.nvim_command('join ' .. count + 1)
			vim.api.nvim_win_set_cursor(0, cursor)
		end)
	map('x', 'p', '"_dP')
	map('n', '<C-U>', '<C-U>zz')
	map('n', '<C-D>', '<C-D>zz')
	map('n', '<C-F>', '<C-F>zz')
	map('n', '<C-B>', '<C-B>zz')
	map('x', '>', '>gvl')
	map('x', '<', '<gvh')
	map('n', 'N', 'Nzz')
	map('n', 'n', 'nzz')
	map('n', '<C-Z>', '<C-A>')
	map('x', '<C-Z>', '<C-A>')
	map('x', 'g<C-Z>', 'g<C-A>')
	map({'n', 'x'}, 'k', 'gk')
	map({'n', 'x'}, 'j', 'gj')

-- LEADER KEYMAPS
-- a b c d e f g h i j k l m n o p q r s t u v w x y z æ ø å 1 2 3 4 5 6 7 8 9 0
--   •   •       • •     •       • • • • •         •         • • • • • • • • • •

map('n', '<space>', '<nop>')
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- b (Buffer)
	map('n', '<leader>bd', '<CMD>bdel<CR>')
	map('n', '<leader>bn', '<CMD>enew<CR>')
-- d (Delete)
	map('n', '<leader>d', '"_d')
	map('x', '<leader>d', '"_d')
-- h (Harpoon)
	local keybinds = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
	map('n', '<leader>0', '<CMD>lua HarpoonPrint()<CR>')
	map('n', '<leader>hD', '<CMD>lua HarpoonDeleteAll()<CR>')
	for _, value in pairs(keybinds) do
		map('n', '<leader>' .. value, '<CMD>lua HarpoonSwitch(' .. value .. ')<CR>')
		map('n', '<leader>h' .. value, '<CMD>lua HarpoonDefine(' .. value .. ')<CR>')
		map('n', '<leader>hd' .. value, '<CMD>lua HarpoonDelete(' .. value .. ')<CR>')
	end
-- i (Inspect)
	map('n', '<leader>i', '<CMD>Inspect<CR>')
-- l (LaTeX)
	map('n', '<leader>lc', '<CMD>lua Latex("compile")<CR>')
	map('n', '<leader>lx', '<CMD>lua Latex("clean")<CR>')
	map('n', '<leader>lv', '<CMD>lua Latex("pdf")<CR>')
	map('n', '<leader>ls', '<CMD>lua Latex("sympy")<CR>')
-- p (Paste system clipboard)
	map('x', '<leader>p', '"_d"+P<CMD>lua print("Pasted from System Clipboard!")<CR>')
	map('n', '<leader>p', '"+p<CMD>lua print("Pasted from System Clipboard!")<CR>')
-- q (Macros)
	map('n', '<leader>q', 'q')
-- r (Replace Substitute)
	map('n', '<leader>r', ':%s/')
	map('x', '<leader>r', ':s/')
-- s (Search Telescope)
	map('n', '<leader>st', '<CMD>Telescope<CR>')
	map('n', '<leader>sp', '<CMD>lua ToggleNetRW()<CR>')
	map('n', '<leader>sf', '<CMD>Telescope find_files<CR>')
	map('n', '<leader>sc',
		function()
			require('telescope.builtin').find_files({
				prompt_title = "NeoVim Configuration",
				cwd = vim.fn.stdpath("config")
			})
		end)
	map('n', '<leader>sb', '<CMD>Telescope buffers<CR>')
	map('n', '<leader>sd', '<CMD>Telescope diagnostics<CR>')
	map('n', '<leader>sh', '<CMD>Telescope help_tags<CR>')
	map('n', '<leader>su', '<CMD>Telescope undo<CR>')
	map('n', '<leader>s/', '<CMD>Telescope current_buffer_fuzzy_find<CR>')
	map('n', '<leader>sg',
		function()
			require('telescope.builtin').grep_string({
				search = vim.fn.input({
					prompt = "Grep > ",
					use_regex = true
				})
			})
		end)
-- t (Toggle)
	map('n', '<leader>tw', '<CMD>set wrap!<CR><CMD>lua print("Wrapping " .. tostring(vim.o.wrap))<CR>')
	map('n', '<leader>ti', '<CMD>set list!<CR><CMD>lua print("List " .. tostring(vim.o.list))<CR>')
	map('n', '<leader>tf', '<CMD>lua ToggleFoldcolumn()<CR>')
	map('n', '<leader>tc', '<CMD>set cursorline!<CR><CMD>lua print("Cursorline " .. tostring(vim.o.cursorline))<CR>')
	map('n', '<leader>tn', '<CMD>set rnu!<CR><CMD>lua print("Relative numbers " .. tostring(vim.o.rnu))<CR>')
	map('n', '<leader>tl', '<CMD>lua ToggleLanguage()<CR>')
-- y (Yank system clipboard)
	map('x', '<leader>y', '"+y<CMD>lua print("Yanked to System Clipboard!")<CR>')
