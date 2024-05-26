local function _Spacer(n)
	local spaces = string.rep(' ', n)
	return '%#StatuslineTextMain#' .. spaces
end

local function _RightAlign()
	return '%='
end

local function _Truncate()
	return '%<'
end

local function ModeColor()
	local current_mode = vim.api.nvim_get_mode().mode
	local higroup = "%#StatuslineTextMain#"
	if current_mode == "n" then
		higroup = "%#StatuslineModeNormal#"
	elseif current_mode == "i" or current_mode == "ic" then
		higroup = "%#StatuslineModeInsert#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		higroup = "%#StatuslineModeVisual#"
	elseif current_mode == "R" or current_mode == "Rv" then
		higroup = "%#StatuslineModeReplace#"
	elseif current_mode == "s" or current_mode == "S" or current_mode == "" then
		higroup = "%#StatuslineModeSelect#"
	elseif current_mode == "c" then
		higroup = "%#StatuslineModeCommand#"
	end
	return higroup
end

local function Mode()
	local modes = {
		["n"] = "NORMAL",
		["no"] = "NORMAL",
		["i"] = "INSERT",
		["ic"] = "INSERT",
		["v"] = "VISUAL",
		["V"] = "V-LINE",
		[""] = "V-BLOCK",
		["s"] = "SELECT",
		["S"] = "S-LINE",
		[""] = "S-BLOCK",
		["R"] = "REPLACE",
		["Rv"] = "V-REPLACE",
		["c"] = "COMMAND",
		["cv"] = "VIM EX",
		["ce"] = "EX",
		["r"] = "PROMPT",
		["rm"] = "MOAR",
		["r?"] = "CONFIRM",
		["!"] = "SHELL",
		["t"] = "TERMINAL",
	}
	local current_mode = vim.api.nvim_get_mode().mode
	return ModeColor() .. '  ' .. modes[current_mode] .. ' ' .. _Spacer(0)
end

local function Path()
	local path = vim.fn.expand('%:~:.:h')
	local higroup = '%#StatuslineTextAccent#'
	if path == '.' or path == '' then
		return ''
	end
	return _Spacer(1) .. higroup .. path
end

local function Filename()
	local filename = vim.fn.expand('%:t')
	local higroup = '%#StatuslineTextMain#'
	if filename == '' then
		return _Spacer(1) .. higroup .. '[No Name]'
	end
	return _Spacer(1) .. higroup .. filename
end

local function Modified()
	local buf_modified  = vim.bo.modified
	local buf_modifiable = vim.bo.modifiable
	local buf_readonly = vim.bo.readonly
	local hi_saved = '%#StatuslineSaved#'
	local hi_notsaved = '%#StatuslineNotSaved#'
	local hi_readonly = '%#StatuslineReadOnly#'
	if buf_modified then
		return _Spacer(1) .. hi_notsaved .. ' ✘ ' .. _Spacer(0)
	elseif buf_modifiable == false or buf_readonly == true then
		return _Spacer(1) .. hi_readonly .. " • " .. _Spacer(0)
	else
		return _Spacer(1) .. hi_saved .. ' ✔ ' .. _Spacer(0)
	end
end

local function Harpoon()
	local final = ""
	local higroup = '%#StatuslineHarpoon#'
	for key, v in pairs(HarpoonBuffers) do
		if v == vim.fn.bufnr() then
			final = final .. tostring(key)
		end
	end
	if final == "" then
		return ""
	else
		return _Spacer(1) .. higroup .. ' ' .. final .. ' ' .. _Spacer(0)
	end
end

local function LspStatus()
	local clients = vim.lsp.buf_get_clients()
	local higroup = '%#StatuslineLspOn#'
	if #clients > 0 then
		return higroup .. 'LSP' .. _Spacer(2)
	else
		return ''
	end
end

local function Diagnostics()
	local count_error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local count_warning = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local count_info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	local count_hint = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	local diag_count = 0
	local higroup_error = '%#StatuslineLspError#'
	local higroup_warning = '%#StatuslineLspWarning#'
	local higroup_info = '%#StatuslineLspInfo#'
	local higroup_hint = '%#StatuslineLspHint#'
	local error, warning, info, hint = '', '', '', ''
	if count_error == 0 then error = ''
		else error = higroup_error .. count_error .. _Spacer(1)
	end
	if count_warning == 0 then warning = ''
		else warning = higroup_warning .. count_warning .. _Spacer(1)
	end
	if count_info == 0 then info = ''
		else info = higroup_info .. count_info .. _Spacer(1)
	end
	if count_hint == 0 then hint = ''
		else hint = higroup_hint .. count_hint.. _Spacer(1)
	end
	if count_error + count_warning + count_info + count_hint == 0 then
		diag_count = 0
	else
		diag_count = 1
	end
	return error .. warning .. info .. hint .. _Spacer(diag_count)
end

local function Percentage()
	local current_line = vim.fn.line('.')
	local total_lines = vim.fn.line('$')
	local percentage = vim.fn.floor(current_line / total_lines * 100)
	local content = ''
	local higroupmain = '%#StatuslineTextMain#'
	local higroupaccent = '%#StatuslineTextAccent#'
	if current_line == 1 then
		content = 'Top'
	elseif current_line == total_lines then
		content = 'End'
	elseif percentage < 10 then
		content = higroupaccent .. '·' .. higroupmain .. percentage .. '%%'
	else
		content = percentage .. '%%'
	end
	return higroupaccent .. '≡ ' .. higroupmain .. content .. _Spacer(2)
end

local function CursorPosition()
	local current_line = vim.fn.line('.')
	local total_lines = vim.fn.line('$')
	local higroupmain = '%#StatuslineTextMain#'
	local higroupaccent = '%#StatuslineTextAccent#'
	return higroupmain .. current_line .. higroupaccent .. ":" .. higroupmain .. total_lines .. _Spacer(2)
end

local function Filetype()
	local higroup = '%#StatuslineFiletype#'
	local filetype = vim.bo.filetype:upper()
	if filetype == '' then
		return higroup .. '-' .. _Spacer(2)
	else
		return higroup .. filetype .. _Spacer(2)
	end
end
Statusline = function()
	return table.concat {
		Mode(),
		Path(),
		Filename(),
		Modified(),
		Harpoon(),
		_Spacer(2),
		_RightAlign(),
		-- Diagnostics(),
		-- LspStatus(),
		-- CursorPosition(),
		Percentage(),
		-- Filetype(),
		_Truncate(),
	}
end

vim.api.nvim_create_augroup('Statusline', { clear = true })
vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
	group = 'Statusline',
	pattern = '*',
	command = 'setlocal statusline=%!v:lua.Statusline()'
})
