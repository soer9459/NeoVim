-- Improve the copy, move, remove, rename, mark, unmark

function ToggleNetRW()
	if vim.bo.filetype ~= 'netrw' then
		vim.api.nvim_command('Ex')
	else
		vim.api.nvim_command('Rex')
		if vim.bo.filetype == 'netrw' then
			vim.api.nvim_command('bdel')
		end
	end
end

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_bufsettings = 'nonu nornu noma nowrap nomod ro nobl'
vim.g.netrw_browse_split = 0 -- (4 to open in other window)
vim.g.netrw_altfile = 0
vim.g.netrw_list_hide = '^\\.\\.\\?/$,\\(^\\|\\s\\s\\)\\zs\\.\\S\\+' -- ALSO HIDE ./ and ../ when hidden files are shown
-- vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'

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
			'<F1>', '<DEL>', '<C-H>', '<C-R>', '<C-TAB>', 'a', 'C', 'gb', 'gd', 'gf', 'gn', 'gp', 'i', 'mb', 'md', 's', 'S', 't', 'v',
			'me', 'mF', 'mg', 'mh', 'mr', 'mT', 'mv', 'mx', 'mX', 'mz', 'o', 'O', 'p', 'P', 'qf', 'qF', 'qL', 'r', 'X', 'I'
			-- '<cr>', '<c-l>', '-', 'd', 'D', 'gh', 'R', '%', 'mf', 'mm', 'mc', 'mu', 'cd', 'qb', 'u', 'U', 'x',
		}
		for _, value in pairs(unbinds) do
			vim.keymap.set('n', value, '<CMD>lua print("Keybind \'' .. value .. '\' has been removed")<CR>', { noremap = true, silent = true, buffer = true })
		end
		vim.keymap.set('n', '<C-C>', '<CMD>lua ToggleNetRW()<CR>', { noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', '<ESC>', '<CMD>lua ToggleNetRW()<CR>', { noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', 'mt', '<CMD>MT<CR>', { noremap = true, silent = true, buffer = true })
		vim.keymap.set('n', '<tab>', 'mfj', { remap = true, silent = true, buffer = true })
		vim.keymap.set('n', 'cd', function()
			vim.api.nvim_command('cd ' .. vim.fn.expand('%:~:p'))
			vim.api.nvim_command('MT n/a')
			print('Changed working directory: ' .. vim.fn.expand('%:~:p'))
		end, { buffer = true })
		vim.keymap.set('n', '<BS>', '-', { remap = true, buffer = true })
		vim.keymap.set('n', 'e', '<CMD>Ex ~<CR>', { buffer = true })
		vim.keymap.set('n', 'w', '<CMD>Ex ' .. vim.fn.getcwd() .. '<CR>', { buffer = true })
		vim.keymap.set('n', 't', function()
			local target = vim.api.nvim_call_function('netrw#Expose', {'netrwmftgt'})
			if target == 'n/a' then
				print("No target directory set")
			elseif string.find(target, "^/") then
				vim.api.nvim_command('Ex ' .. target)
			else
				vim.api.nvim_command('Ex ' .. vim.fn.getcwd() .. '/' .. target)
			end
		end, { buffer = true })
	end
})

local function TargetDir()
	local target = vim.api.nvim_call_function('netrw#Expose', {'netrwmftgt'})
	if target == 'n/a' then
		return '%#StatuslineTextAccent#' .. '➔ None '
	else
		target = target:gsub("^" .. vim.loop.os_homedir(), "~")
		local cwd = vim.fn.getcwd():gsub("^" .. vim.loop.os_homedir(), "~")
		local final = target:gsub("^" .. cwd .. "/", "")
		return '%#StatuslineTextAccent#' .. '➔ ' .. '%#StatuslineTextMain#' .. final .. ' '
	end
end

local function Path()
	-- local path = vim.fn.expand('%:~:.') -- Relative
	local path = vim.fn.expand('%:~') -- Absolute
	return '%#StatuslineTextMain# ' .. path
end

local function Hidden()
	local hidden = vim.g.netrw_list_hide
	if hidden == '^\\.\\.\\?/$,\\(^\\|\\s\\s\\)\\zs\\.\\S\\+' then
		return "%#StatuslineTextAccent#  Hide: On"
	else
		return "%#StatuslineTextAccent#  Hide: Off"
	end
end

WinBarNetRW = function()
	return table.concat {
	Path(),
	Hidden(),
	"%=",
	' ',
	TargetDir(),
	"%<",
	}
end
