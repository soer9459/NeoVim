-- :h group-name, highlight-groups, treesitter-highlight-groups,
-- :h diagnostic-highlights, lsp-highlight, lsp-semantic-highlight, expr-highlight
-- Mason and other plugin highlights are still initiated when using simple theme. They should be overwritten somehow? Or maybe not?

BaseColor = HSL(235, 19, 13)  -- Blue
-- BaseColor = HSL(20, 15, 12)  -- Brown
-- BaseColor = HSL(20, 10, 12)  -- Brown Desaturated
-- BaseColor = HSL(100, 15, 12)  -- Green
-- BaseColor = HSL(0, 0, 12)  -- Grey
-- BaseColor = HSL(0, 0, 0)  -- Black
-- BaseColor = HSL(249, 22, 12)  -- Rose-Pine Default
-- BaseColor = HSL(0, 0, 6) -- Custom

BoldOption = true
ItalicOption = true
UnderlineOption = true

local highlightcheck = false

local theme = "simplered"
	-- "" (no theme)
	-- basics
	-- simplered
	-- rose-pine
local colorscheme = ""
	-- "" (no colorscheme)
	-- vim (old default)
	-- default (neovim default)

-------------------------------------------------------------------
---------------------------- SET THEME ----------------------------
-------------------------------------------------------------------

-- CLEAR INIT
vim.api.nvim_command("syntax clear")
vim.api.nvim_command("highlight clear")

-- CLEAR HIGHLIGHT GROUPS
if highlightcheck then
	for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
		vim.api.nvim_set_hl(0, group, { fg = 'Green', bg = 'Pink' })
	end
else
	for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
		vim.api.nvim_set_hl(0, group, {})
	end
end

-- SET DEFAULT COLORSCHEME
if colorscheme ~= "" then
	vim.api.nvim_command("colorscheme " .. colorscheme)
end

-- CLEAR LSP HIGHLIGHTS
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do vim.api.nvim_set_hl(0, group, {}) end

-- INITIATE FUNCTIONS
local path = vim.fn.stdpath('config') .. "/lua/user/theme/"
dofile(path .. "functions/blend.lua")
dofile(path .. "functions/hsl.lua")

-- APPLY HIGHLIGHT GROUPS AND COLORS
if theme == "" then
	return
else
	local M = dofile(path .. "themes/" .. theme .. ".lua")
	for tablename, table in pairs(M) do
		if tablename ~= "colors" then
			for highlight, options in pairs(table) do
				vim.api.nvim_set_hl(0, highlight, options)
			end
		end
	end
end
