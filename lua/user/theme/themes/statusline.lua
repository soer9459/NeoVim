local M = {}

M.colors = {
	-- BACKGROUND COLOR
	BackgroundColor = BackgroundColor,
	-- TERMINAL COLORS
	Black = "#0D0C12",
	Red = "#EB6F92",
	Green = "#9ED979",
	Blue = "#31748F",
	Yellow = "#F6C177",
	Magenta = "#C4A7E7",
	Cyan = "#9CCFD8",
	White = "#E0DEF4",
	BrightBlack = "#505769",
	BrightRed = "#B4637A",
	BrightGreen = "#7DAC60",
	BrightYellow = "#c78e3e",
	BrightBlue = "#286983",
	BrightMagenta = "#907AA9",
	BrightCyan = "#56949F",
	BrightWhite = "#9EA6BC",
	-- OTHER COLORS
	hlFloat = HSB(BackgroundColor, 0, 0, 0.06),
	hlCursorLine = HSB(BackgroundColor, 0, 0, 0.04),
}

local c = M.colors

M.default = {
	Normal = {},
	NormalNC = {},
	--NormalFloat = { bg = c.hlFloat },
	--Pmenu = { bg = c.hlFloat },
	--PmenuSel = { fg = c.hlFloat, bg = c.White },
	--CursorLine = { bg = c.hlCursorLine }
}
M.yankhighlight = {
	YankHighlight = { fg = c.Black, bg = c.White },
}
M.statusline = {
	StatuslineTextMain = { fg = c.White, bg = c.Black },
	StatuslineTextAccent = { fg = c.BrightBlack, bg = c.Black },
	StatuslineModeNormal = { fg = c.White, bg = c.BrightBlue },
	StatuslineModeInsert = { fg = c.White, bg = c.BrightCyan },
	StatuslineModeVisual = { fg = c.White, bg = c.BrightYellow },
	StatuslineModeReplace = { fg = c.White, bg = c.BrightRed },
	StatuslineModeCommand = { fg = c.White, bg = c.BrightBlack },
	StatuslineModeSelect = { fg = c.White, bg = c.BrightMagenta },
	StatuslineFiletype = { fg = c.White, bg = c.Black },
	StatuslineSaved = { fg = c.White, bg = c.BrightGreen },
	StatuslineNotSaved = { fg = c.White, bg = c.BrightRed },
	StatuslineReadOnly = { fg = c.White, bg = c.BrightYellow },
	StatuslineLspOn = { fg = c.BrightWhite, bg = c.Black },
	StatuslineLspError = { fg = c.Red, bg = c.Black },
	StatuslineLspWarning = { fg = c.Yellow, bg = c.Black },
	StatuslineLspInfo = { fg = c.Blue, bg = c.Black },
	StatuslineLspHint = { fg = c.White, bg = c.Black },
	StatuslineHarpoon = { fg = c.White, bg = c.BrightMagenta },
}

return M
