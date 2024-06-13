-- Improve the copy, move, remove, rename etc. routines

function ToggleNetRW()
	if vim.bo.filetype == 'netrw' then
		vim.api.nvim_command('Rex')
		if vim.bo.filetype == 'netrw' then
			vim.api.nvim_command('bdel')
		end
	else
		vim.api.nvim_command('Ex')
	end
end

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_bufsettings = 'nonu nornu noma ro nobl'
vim.g.netrw_browse_split = 0 -- (4 to open in other window)
vim.g.netrw_altfile = 0 -- (4 to open in other window)
-- vim.g.netrw_list_hide = '^\\.\\.\\?/$,\\(^\\|\\s\\s\\)\\zs\\.\\S\\+' -- ALSO HIDE ./ and ../ when hidden files are shown
vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'

vim.api.nvim_create_augroup('netrw', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
	group = 'netrw',
	pattern = 'netrw',
	callback = function()
		-- vim.wo.winfixbuf = true -- fixes window to current buffer.
		vim.api.nvim_command('setlocal buftype=nofile')
		vim.api.nvim_command('setlocal bufhidden=wipe')
		vim.opt_local.winbar = '%!v:lua.WinBarNetRW()'
		local unbinds = {
			'<F1>', '<del>', '<c-h>', '<c-r>', '<c-tab>', 'a', 'C', 'gb', 'gd', 'gf', 'gn', 'gp', 'i', 'mb', 'md', 's', 'S', 't', 'v',
			'me', 'mF', 'mg', 'mh', 'mr', 'mT', 'mv', 'mx', 'mX', 'mz', 'o', 'O', 'p', 'P', 'qf', 'qF', 'qL', 'r', 'x', 'X', 'I',
			-- '<cr>', '<c-l>', '-', 'd', 'D', 'gh', 'R', '%', 'mf', 'mm', 'mc', 'mu', 'mt', 'cd', 'qb', 'u', 'U'
		}
		for _, value in pairs(unbinds) do
			vim.keymap.set('n', value, '<CMD>lua print("Keybind \'' .. value .. '\' has been removed")<CR>', { noremap = true, silent = true, buffer = true })
		end
		vim.keymap.set('n', '<C-C>', '<CMD>lua ToggleNetRW()<CR>', { noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', '<esc>', '<CMD>lua ToggleNetRW()<CR>', { noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', 'e', '<CMD>Ex ~<CR>', { noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', 'w', '<CMD>Ex ' .. vim.fn.getcwd() .. '<CR>', { noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', '<BS>', '-', { remap = true, silent = true, buffer = true })
		vim.keymap.set('n', 't', function()
			local target = vim.api.nvim_call_function('netrw#Expose', {'netrwmftgt'})
			if target == 'n/a' then
				print("No target directory set")
			else
				vim.api.nvim_command('Ex ' .. target)
			end
		end, { noremap = true, silent = true, buffer = true })
	end
})

local function TargetDir()
	local target = vim.api.nvim_call_function('netrw#Expose', {'netrwmftgt'})
	if target == 'n/a' then
		-- return '%#StatuslineTextAccent#' .. 'Target: ' .. '%#StatuslineTextMain#' .. '#N/A '
		return '%#StatuslineTextAccent#' .. 'Target: None '
	else
		target = target:gsub("^" .. vim.loop.os_homedir(), "~")
		return '%#StatuslineTextAccent#' .. 'Target: ' .. '%#StatuslineTextMain#' .. target .. ' '
	end
end

local function Path()
	-- local path = vim.fn.expand('%:~:.') -- Relative
	local path = vim.fn.expand('%:~') -- Absolute
	return '%#StatuslineTextMain# ' .. path
end

WinBarNetRW = function()
	return table.concat {
	Path(),
	"%=",
	TargetDir(),
	"%<",
	}
end
