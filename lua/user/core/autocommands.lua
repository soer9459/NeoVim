local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('AutoCommands', { clear = true })

-- HIGHLIGHT YANKING TEXT
autocmd('TextYankPost', {
	group = 'AutoCommands',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank{ higroup = 'YankHighlight', timeout = 200 }
	end
})

-- AUTOSOURCE THEME
autocmd('BufWritePost', {
	group = 'AutoCommands',
	pattern = '*',
	callback = function()
		local buffer = vim.api.nvim_buf_get_name(0)
		local config = vim.fn.stdpath('config')
		local pattern = '^' .. config .. '/lua/user/theme/'
		if string.match(buffer, pattern) then
			vim.api.nvim_command('source ' .. config .. '/lua/user/theme/theme.lua')
		end
	end
})

-- AUTOSOURCE CORE FOLDER
autocmd('BufWritePost', {
	group = 'AutoCommands',
	pattern = '*',
	callback = function()
		local buffer = vim.api.nvim_buf_get_name(0)
		local config = vim.fn.stdpath('config')
		local pattern = '^' .. config .. '/lua/user/core/'
		if string.match(buffer, pattern) then
			vim.api.nvim_command('source %')
		end
	end
})

-- REMOVE TRAILING WHITESPACE
autocmd('BufWritePre', {
	group = 'AutoCommands',
	pattern = '*',
	callback = function()
		local cursor = vim.api.nvim_win_get_cursor(0)
		vim.api.nvim_command('%s/\\s\\+$//e')
		vim.api.nvim_win_set_cursor(0, cursor)
	end
})

-- ENABLE HLSEARCH
autocmd('CmdlineChanged', {
	group = 'AutoCommands',
	pattern = '*',
	callback = function()
		local cmdtype = vim.fn.getcmdtype()
		local cmdline = vim.fn.getcmdline()
		if cmdtype == '/'
			or cmdtype == '?'
			or cmdline:find("g[lobal]*!?[^%a]")
			or cmdline:find("v[global]*[^%a]")
		then
			vim.o.hlsearch = true
		else
			vim.o.hlsearch = false
		end
	end
})

-- DISABLE HLSEARCH
autocmd('CmdlineLeave', {
	group = 'AutoCommands',
	pattern = '*',
	callback = function()
		vim.o.hlsearch = false
	end
})
