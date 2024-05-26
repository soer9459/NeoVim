-- help topics to check all the highlights:
-- :h group-name
-- :h highlight-groups
-- :h treesitter-highlight-groups
-- :h diagnostic-highlights
-- :h lsp-highlight
-- :h lsp-semantic-highlight
-- :h expr-highlight
--
-- Better HSLUV and Blend Functions

BackgroundColor = "#1a1b26" -- Default
-- BackgroundColor = "#191724" -- Rose-Pine Default
-- BackgroundColor = "#181818"
-- BackgroundColor = "#000000"

BoldOption = true
ItalicOption = true
UnderlineOption = true

local highlightcheck = true

-- Mason and other plugin highlights are still initiated when using simple theme. They should be overwritten somehow? Or maybe not?
local theme = "rose-pine"
	-- "" (no theme)                statusline                  simplered
	-- rose-pine
local colorscheme = ""
	-- "" (no colorscheme)          vim (old default)           default (neovim default)

-------------------------------------------------------------------
---------------------------- SET THEME ----------------------------
-------------------------------------------------------------------

-- CLEAR INIT
vim.cmd("syntax clear")
vim.cmd("highlight clear")

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
	vim.cmd("colorscheme " .. colorscheme)
end

-- CLEAR LSP HIGHLIGHTS
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do vim.api.nvim_set_hl(0, group, {}) end

-- INITIATE FUNCTIONS
local path = vim.fn.stdpath('config') .. "/lua/user/theme/"
dofile(path .. "functions/hsluv.lua")
dofile(path .. "functions/blend.lua")

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
