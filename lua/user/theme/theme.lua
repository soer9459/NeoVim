BaseColor = "#1a1b26" -- Blue
-- BaseColor = "#1f1f2e" -- Blue Alt
-- BaseColor = "#231d1a" -- Brown
-- BaseColor = "#211d1b" -- Brown Desaturated
-- BaseColor = "#1d231a" -- Green
-- BaseColor = "#1e1e1e" -- Grey
-- BaseColor = "#141414" -- DarkGrey
-- BaseColor = "#000000" -- Black
-- BaseColor = "#191724" -- Rose-Pine Default
-- BaseColor = HSL(0, 0, 10) -- Custom

-- local theme = ""
-- local theme = "basics"
local theme = "simplered"
-- local theme = "rose-pine"

-- local colorscheme = ""
-- local colorscheme = "vim" -- Vim default
local colorscheme = "default" -- NeoVim default

local highlightcheck = false

BoldOption = true
ItalicOption = true
UnderlineOption = true

-------------------------------------------------------------------
---------------------------- SET THEME ----------------------------
-------------------------------------------------------------------

-- CLEAR INIT
vim.api.nvim_command("syntax clear")
vim.api.nvim_command("highlight clear")

-- CLEAR HIGHLIGHT GROUPS
for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
	if highlightcheck then
		vim.api.nvim_set_hl(0, group, { fg = 'Green', bg = 'Pink' })
	else
		vim.api.nvim_set_hl(0, group, {})
	end
end

-- SET DEFAULT COLORSCHEME
if colorscheme ~= "" then
	vim.api.nvim_command("colorscheme " .. colorscheme)
end

-- CLEAR LSP HIGHLIGHTS
-- Also down-prioritized in options.lua
 for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
 	vim.api.nvim_set_hl(0, group, {})
 end

-- APPLY HIGHLIGHT GROUPS AND COLORS
if theme ~= "" then
	local M = dofile(vim.fn.stdpath('config') .. "/lua/user/theme/themes/" .. theme .. ".lua")
	for tablename, table in pairs(M) do
		if tablename ~= "colors" then
			for highlight, options in pairs(table) do
				vim.api.nvim_set_hl(0, highlight, options)
			end
		end
	end
end
