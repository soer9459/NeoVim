vim.api.nvim_create_augroup('netrw', { clear = true })
local current_buf = nil

-- KEEP TRACK OF LAST BUFFER
vim.api.nvim_create_autocmd({'BufEnter', 'BufAdd'}, {
	group = 'netrw',
	callback = function()
		if vim.bo.filetype ~= 'netrw' then
			current_buf = vim.api.nvim_get_current_buf()
		end
	end
})

-- TOGGLE FUNCTION
function ToggleNetRW()
	if vim.bo.filetype ~= 'netrw' then
		vim.api.nvim_command("Ex")
	else
		vim.api.nvim_command("buffer " .. current_buf)
		if vim.bo.filetype == 'netrw' then
			vim.api.nvim_command("bdel")
		end
	end
end
vim.api.nvim_command('command! ToggleNetRW lua ToggleNetRW()')

-- NETRW SETTINGS
vim.api.nvim_create_autocmd('FileType', {
	group = 'AutoCommands',
	pattern = 'netrw',
	callback = function()
		vim.o.nu = true
		vim.o.rnu = true
		vim.opt_local.winbar = " File Browser (NETRW)"
	end
})

-- KEYMAPS
vim.api.nvim_create_autocmd('FileType', {
	group = 'netrw',
	pattern = 'netrw',
	callback = function()
		vim.keymap.set('n', 'e', '<CMD>Ex ~<CR>', { noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', 'w', '<CMD>Ex ' .. vim.fn.getcwd() .. '<CR>', {noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', '<C-C>', '<CMD>ToggleNetRW<CR>', { noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', '<esc>', '<CMD>ToggleNetRW<CR>', { noremap = true, silent = true, buffer = true })
	end
})

