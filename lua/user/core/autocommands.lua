local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('AutoCommands', { clear = true })

-- HIGHLIGHT YANKING TEXT
autocmd('TextYankPost', {
	group = 'AutoCommands',
	callback = function()
		vim.highlight.on_yank{ higroup = 'YankHighlight', timeout = 200 }
	end
})

-- AUTOSOURCE THEME & CORE
autocmd('BufWritePost', {
	group = 'AutoCommands',
	callback = function()
		local buffer = vim.api.nvim_buf_get_name(0)
		local config = vim.fn.stdpath('config')
		local pattern_theme = '^' .. config .. '/lua/user/theme/'
		local pattern_core = '^' .. config .. '/lua/user/core/'
		if string.match(buffer, pattern_theme) then
			vim.api.nvim_command('source ' .. config .. '/lua/user/theme/theme.lua')
		end
		if string.match(buffer, pattern_core) then
			vim.api.nvim_command('source %')
		end
	end
})

-- REMOVE TRAILING WHITESPACE
autocmd('BufWritePre', {
	group = 'AutoCommands',
	callback = function()
		local cursor = vim.api.nvim_win_get_cursor(0)
		vim.api.nvim_command('%s/\\s\\+$//e')
		vim.api.nvim_win_set_cursor(0, cursor)
	end
})

-- ENABLE HLSEARCH
autocmd('CmdlineChanged', {
	group = 'AutoCommands',
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
	callback = function()
		vim.o.hlsearch = false
	end
})
