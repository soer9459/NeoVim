local M = {}

M.colors = {}
local c = M.colors

c.BG = BaseColor
c.Black = HSL( 250, 20, 6 )
c.Grey = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 54)
c.White = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 93)
c.Green = HSL(130, 30, 52)
c.Red = HSL(0, 58, 52)
c.Yellow = HSL(30, 50, 60)
c.Magenta = HSL(280, 50, 70)
c.hlFloat = HSL( HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 2 )
c.hlWhitespace = HSL( HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 6 )
c.hlCursorLine = HSL( HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 4 )
c.hlStatusLine = HSL(HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 15 )
c.hlVisual = HSL( HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 10 )
c.Normal = HSL( HSL_H(c.BG), HSL_S(c.BG) / 1.5 , 80)

M.default = {
	Normal = { fg = c.Normal },
	NormalNC = {},
	NormalFloat = { bg = c.hlFloat },
	Pmenu = { bg = c.hlCursorLine },
	PmenuSel = { fg = c.White, bg = c.hlStatusLine },
	CursorLine = { bg = c.hlCursorLine },
	Visual = { bg = c.hlVisual },
	WinBar = { link = 'StatuslineTextMain' },
	WinBarNC = { link = 'WinBar' },
	Whitespace = { fg = c.hlWhitespace },
}
M.yankhighlight = {
	YankHighlight = { fg = c.Black, bg = c.White },
}
M.statusline = {
	StatuslineTextMain = { fg = c.White, bg = c.hlStatusLine },
	StatuslineTextAccent = { fg = c.Grey, bg = c.hlStatusLine },
	StatuslineModeNormal = { fg = c.White, bg = c.hlStatusLine, bold = BoldOption },
	StatuslineModeInsert = { fg = c.White, bg = c.hlStatusLine, bold = BoldOption },
	StatuslineModeVisual = { fg = c.White, bg = c.hlStatusLine, bold = BoldOption },
	StatuslineModeReplace = { fg = c.White, bg = c.hlStatusLine, bold = BoldOption },
	StatuslineModeCommand = { fg = c.White, bg = c.hlStatusLine, bold = BoldOption },
	StatuslineModeSelect = { fg = c.White, bg = c.hlStatusLine, bold = BoldOption },
	StatuslineFiletype = { fg = c.White, bg = c.hlStatusLine },
	StatuslineSaved = { fg = c.Green, bg = c.hlStatusLine },
	StatuslineNotSaved = { fg = c.Red, bg = c.hlStatusLine },
	StatuslineReadOnly = { fg = c.Yellow, bg = c.hlStatusLine },
	StatuslineLspOn = { fg = c.White, bg = c.hlStatusLine },
	StatuslineLspError = { fg = c.White, bg = c.hlStatusLine },
	StatuslineLspWarning = { fg = c.White, bg = c.hlStatusLine },
	StatuslineLspInfo = { fg = c.White, bg = c.hlStatusLine },
	StatuslineLspHint = { fg = c.White, bg = c.hlStatusLine },
	StatuslineHarpoon = { fg = c.Magenta, bg = c.hlStatusLine },
}

return M
