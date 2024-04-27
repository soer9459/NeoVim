--[[
BackgroundColor = "#191724" -- Rose-Pine Default
BackgroundColor = "#2E3440" -- Nord Default
BackgroundColor = "#242834" -- Nord Darker
]]--

BackgroundColor = "#1a1b26" -- Default

local theme = "rose-pine"

BoldOption = 1
ItalicOption = 1
UnderlineOption = 1

-------------------
---- SET THEME ----
-------------------

local config = vim.fn.stdpath('config')
local path = config .. "/lua/user/theme/"

dofile(path .. "functions/hsluv.lua")
dofile(path .. "functions/blend.lua")

local M = dofile(path .. "themes/" .. theme .. ".lua")

vim.cmd("syntax clear")
vim.cmd("highlight clear")

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do vim.api.nvim_set_hl(0, group, {}) end

for tablename, table in pairs(M) do
	if tablename ~= "colors" then
		for highlight, options in pairs(table) do
			vim.api.nvim_set_hl(0, highlight, options)
		end
	end
end
