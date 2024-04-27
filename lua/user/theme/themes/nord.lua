local M = {}

M.colors = {
	-- BACKGROUND COLOR
	BackgroundColor = BackgroundColor,
	-- TERMINAL COLORS
	Black = "#0D0C12",
	Red = "#BF616A", -- Red nord11
	Green = "#A3BE8C", -- Green nord14
	Blue = "#5E81AC", -- Blue nord10
	Yellow = "#EBCB8B", -- Yellow nord13
	Magenta = "#B48EAC", -- Purple nord15
	Cyan = "#8FBCBB", -- Teal nord7
	White = "#ECEFF4", -- White nord6
	BrightBlack = "#505769",
	BrightRed = "#B4637A",
	BrightGreen = "#7DAC60",
	BrightYellow = "#c78e3e",
	BrightBlue = "#286983",
	BrightMagenta = "#907AA9",
	BrightCyan = "#56949F",
	BrightWhite = "#9EA6BC",
	-- OTHER COLORS
	nord0 = BackgroundColor, --black Also BackgroundColor
	nord1 = "#3B4252", --dark_gray -- Maybe depend on background color
	nord2 = "#434C5E", --gray -- Maybe depend on background color
	nord3 = "#4C566A", --light_gray -- Maybe depend on background color
	nord3_bright = "#616E88", -- out of palette light_gray_bright
	nord4 = "#D8DEE9", --darkest_white
	nord5 = "#E5E9F0", --darker_white
	nord8 = "#88C0D0", --off_blue
	nord9 = "#81A1C1", --glacier
	nord12 = "#D08770", --orange
	none = "NONE",
}

local c = M.colors

M.basics = {
	--SpecialKey = {},
	EndOfBuffer = { fg = c['nord1'] },
	--TermCursor = {},
	--TermCursorNC = {},
	NonText = { fg = c['nord1'] },
		--Whitespace = {},
	Directory = { fg = c['Cyan'], bg = c['none'] },
	ErrorMsg = { fg = c['none'] },
	IncSearch = { fg = c['White'], bg = c['Blue'] },
	Search = { fg = c['White'], bg = c['Blue'] },
		--CurSearch = {},
		--QuickFixLine = {},
		Substitute = { fg = c['nord0'], bg = c['nord12'] },
	MoreMsg = { fg = c['nord4'] },
	ModeMsg = { fg = c['nord4'] },
	LineNr = { fg = c['nord3_bright'] },
		--LineNrAbove = {},
		--LineNrBelow = {},
	CursorLineNr = { fg = c['nord4'] },
	SignColumn = { fg = c['nord4'], bg = c['none']},
		--CursorLineSign = {},
	FoldColumn = { fg = c['Cyan'] },
		--CursorLineFold = {},
	Question = { fg = c['Green'] },
	--StatusLine = {},
		--MsgSeparator = {},
	--StatusLineNC = {},
	Title = { fg = c['Green'], bg = c['none'], bold = BoldOption },
		--['@text.title'] = {},
	Visual = { fg = c['none'], bg = c['nord2'] },
	--VisualNC = {},
	WarningMsg = { fg = c['Magenta'] },
	--WildMenu = {},
	Folded = { fg = c['nord3_bright'], bg = c['none'], italic = ItalicOption },
	--DiffAdd = {},
	--DiffChange = {},
	--DiffDelete = {},
	--DiffText = {},
	Conceal = { fg = c['nord1'] },
	--SpellBad = {},
	--SpellCap = {},
	--SpellLocal = {},
	--SpellRare = {},
	Pmenu = { fg = c['nord4'], bg = c['nord2'] },
		--PmenuKind = {},
		--PmenuExtra = {},
		--NormalFloat = {},
	PmenuSel = { fg = c['nord4'], bg = c['Blue'] },
		--PmenuKindSel = {},
		--PmenuExtraSel = {},
	PmenuSbar = { fg = c['nord4'], bg = c['nord2'] },
	PmenuThumb = { fg = c['nord4'], bg = c['nord4'] },
	TabLine = { fg = c['nord4'], bg = c['nord1'] },
	TabLineSel = { fg = c['nord1'], bg = c['nord9'] },
	TabLineFill = { fg = c['nord4'], bg = c['none'] },
	--CursorColumn = {},
	--CursorLine = {},
	ColorColumn = { fg = c['none'], bg = c['nord1'] },
	--NormalNC = {}) --bg = c['BackgroundColor'] removed
	--MsgArea = {},
	--FloatBorder = {},
	--WinBar = {},
	--WinBarNC = {},
	--Cursor = {},
	--FloatTitle = {},
	--lCursor = {},
	Normal = { fg = c['nord4'] },
		VertSplit = { fg = c['nord2'], bg = c['none'] },
			--WinSeparator = {},
	--FloatShadow = {},
	--FloatShadowThrough = {},
	--RedrawDebugNormal = {},
	--RedrawDebugClear = {},
	--RedrawDebugComposed = {},
	--RedrawDebugRecompose = {},
	Error = { fg = c['Red'], bg = c['none'], bold = BoldOption, underline = UnderlineOption },
	Todo = { fg = c['Yellow'], bg = c['none'], bold = BoldOption, italic = ItalicOption },
		--['@text.todo'] = {},
	Constant = { fg = c['nord4'] },
		String = { fg = c['Green'], italic = ItalicOption },
			['@string'] = { fg = c['Green'], italic = ItalicOption },
		Character = { fg = c['Green'] },
			['@character'] = { fg = c['Green'], italic = ItalicOption },
		Number = { fg = c['Magenta'] },
			Float = { fg = c['Magenta'] },
				['@float'] = { fg = c['Magenta'] },
			['@number'] = { fg = c['Magenta'] },
		Boolean = { fg = c['nord9'] },
			['@boolean'] = { fg = c['nord9'], bold = BoldOption },
		['@constant'] = { fg = c['Yellow'] },
		--['@lsp.type.enumMember'] = {},
	Identifier = { fg = c['nord9'], italic = ItalicOption },
		Function = { fg = c['nord8'], italic = ItalicOption },
			['@function'] = { fg = c['nord8'], italic = ItalicOption },
			['@method'] = { fg = c['nord8'], italic = ItalicOption },
			--['@lsp.type.decorator'] = {},
			--['@lsp.type.function'] = {},
			--['@lsp.type.method'] = {},
		['@text.reference'] = { fg = c['Magenta'], bold = BoldOption },
		['@parameter'] = { fg = c['Blue'] },
		['@field'] = { fg = c['nord4'], italic = ItalicOption },
		['@property'] = { fg = c['Blue'], italic = ItalicOption },
		['@variable'] = { fg = c['nord4'], bold = BoldOption },
		['@namespace'] = { fg = c['nord4'], italic = ItalicOption },
		--['@lsp.type.parameter'] = {},
		--['@lsp.type.property'] = {},
		--['@lsp.type.variable'] = {},
	Statement = { fg = c['nord9'] },
		Conditional = { fg = c['nord9'], italic = ItalicOption },
			['@conditional'] = { fg = c['nord9'], italic = ItalicOption },
		Repeat = { fg = c['nord9'], italic = ItalicOption },
			['@repeat'] = { fg = c['nord9'], italic = ItalicOption },
		Label = { fg = c['nord9'] },
			['@label'] = { fg = c['Magenta'] },
		Operator = { fg = c['nord9'] },
			['@operator'] = { fg = c['nord9'] },
		Keyword = { fg = c['nord9'], italic = ItalicOption },
			['@keyword'] = { fg = c['nord9'], italic = ItalicOption },
		Exception = { fg = c['nord9'] },
			['@exception'] = { fg = c['Magenta'] },
	PreProc = { fg = c['nord9'] },
		Include = { fg = c['nord9'] },
			['@include'] = { fg = c['nord9'] },
		Define = { fg = c['nord9'] },
			['@constant.macro'] = { fg = c['Cyan'], bold = BoldOption },
			--['@define'] = {},
		Macro = { fg = c['nord9'] },
			--['@macro'] = {},
			['@function.macro'] = { fg = c['Cyan'] },
			--['@lsp.type.macro'] = {},
		PreCondit = { fg = c['Yellow'] },
		--['@preproc'] = {},
	Type = { fg = c['nord9'] },
		StorageClass = { fg = c['nord9'] },
			--['@storageclass'] = {},
		Structure = { fg = c['nord9'] },
			--['@lsp.type.class'] = {},
			--['@lsp.type.enum'] = {},
			--['@lsp.type.interface'] = {},
			--['@lsp.type.namespace'] = {},
			--['@lsp.type.struct'] = {},
		Typedef = { fg = c['nord9'] },
			--['@type.definition'] = {},
			--['@lsp.type.typeParameter'] = {},
		['@type'] = { fg = c['nord9'] },
		--['@lsp.type.type'] = {},
	Special = { fg = c['nord4'] },
		Tag = { fg = c['nord4'] },
			['@tag'] = { fg = c['nord4'] },
		SpecialChar = { fg = c['Yellow'] },
			['@string.escape'] = { fg = c['Magenta'], italic = ItalicOption },
			--['@string.special'] = {},
			--['@character.special'] = {},
		Delimiter = { fg = c['White'] },
			--['@punctuation'] = {},
		SpecialComment = { fg = c['nord8'] },
		Debug = { fg = c['Red'] },
			--['@debug'] = {},
		['@constant.builtin'] = { fg = c['Cyan'], bold = BoldOption },
		['@function.builtin'] = { fg = c['nord8'], italic = ItalicOption },
		['@constructor'] = { fg = c['nord9'] },
	DiagnosticError = { fg = c['Red'] },
		--DiagnosticVirtualTextError = {},
		--DiagnosticFloatingError = {},
		--DiagnosticSignError = {},
	DiagnosticWarn = { fg = c['Magenta'] },
		--DiagnosticVirtualTextWarn = {},
		--DiagnosticFloatingWarn = {},
		--DiagnosticSignWarn = {},
	DiagnosticInfo = { fg = c['Blue'] },
		--DiagnosticVirtualTextInfo = {},
		--DiagnosticFloatingInfo = {},
		--DiagnosticSignInfo = {},
	DiagnosticHint = { fg = c['nord9'] },
		--DiagnosticVirtualTextHint = {},
		--DiagnosticFloatingHint = {},
		--DiagnosticSignHint = {},
	--DiagnosticOk = {},
		--DiagnosticVirtualTextOk = {},
		--DiagnosticFloatingOk = {},
		--DiagnosticSignOk = {},
	--DiagnosticUnderlineError = {},
	--DiagnosticUnderlineHint = {},
	--DiagnosticUnderlineInfo = {},
	--DiagnosticUnderlineWarn = {},
	--DiagnosticUnderlineOk = {},
	--DiagnosticDeprecated = {},
	Comment = { fg = c['nord3_bright'], italic = ItalicOption },
		--DiagnosticUnnecessary = {},
		['@text.literal'] = { fg = c['nord4'] },
		['@comment'] = { fg = c['nord3_bright'], italic = ItalicOption },
		--['@lsp.type.comment'] = {},
	['@text'] = { fg = c['nord4'] },
	Underlined = { fg = c['Green'], bg = c['none'], underline = UnderlineOption },
		['@text.underline'] = { fg = c['nord4'], bg = c['none'], underline = UnderlineOption },
		['@text.uri'] = { fg = c['Green'], underline = UnderlineOption },
	--['@lsp'] = {},
	MatchParen = { fg = c['Magenta'], bg = c['none'], bold = BoldOption },
	Ignore = { fg = c['nord1'] },
}
M.basicsother = {
	--NvimInternalError = {},
	--DiagnosticDefaultError = {},
	--DiagnosticDefaultHint = {},
	--DiagnosticDefaultInfo = {},
	--DiagnosticDefaultWarn = {},
	diffAdded = { fg = c['Green'] },
	diffChanged = { fg = c['Magenta'] },
	diffRemoved = { fg = c['Red'] },
	--StatusLineTerm = {},
	--StatusLineTermNC = {},
	--FloatBorder = make_border()) --FIX
}
M.treesitter = {
	--['@variable'] defined under basics
		['@variable.builtin'] = { fg = c['nord4'], bold = BoldOption },
		--['@variable.parameter'] = {},
		--['@variable.member'] = {},
	--['@string'] defined under basics
		--['@string.regexp'] = {},
		--['@string.special'] defined under basics
			--['@string.special.symbol'] = {},
			--['@string.special.url'] = {},
	--['@keyword'] defined under basics
		['@keyword.operator'] = { fg = c['nord8'], italic = ItalicOption },
		--['@keyword.import'] = {},
		--['@keyword.storage'] = {},
		--['@keyword.repeat'] = {},
		['@keyword.return'] = { fg = c['nord8'], italic = ItalicOption },
		--['@keyword.debug'] = {},
		--['@keyword.exception'] = {},
		--['@keyword.conditional'] = {},
			--['@keyword.conditional.ternary'] = {},
		--['@keyword.directive'] = {},
			--['@keyword.directive.define'] = {},
	--['@punctuation'] defined under basics
		['@punctuation.delimiter'] = { fg = c['nord8'] },
		['@punctuation.bracket'] = { fg = c['nord8'] },
		['@punctuation.special'] = { fg = c['nord8'] },
	--['@comment'] defined under basics
		--['@comment.error'] = {},
		--['@comment.warning'] = {},
		--['@comment.todo'] = {},
		--['@comment.hint'] = {},
		--['@comment.info'] = {},
		--['@comment.note'] = {},
	--markdownDelimiter = {},
	--markdownH1 = {},
	--markdownH1Delimiter = {},
	--markdownH2 = {},
	--markdownH2Delimiter = {},
	--markdownH3 = {},
	--markdownH3Delimiter = {},
	--markdownH4 = {},
	--markdownH4Delimiter = {},
	--markdownH5 = {},
	--markdownH5Delimiter = {},
	--markdownH6 = {},
	--markdownH6Delimiter = {},
	--markdownLinkText = {},
	--markdownUrl = {},
	--['@markup'] not defined
		--['@markup.strong'] = {},
		--['@markup.italic'] = {},
		--['@markup.strikethrough'] = {},
		--['@markup.underline'] = {},
		--['@markup.heading'] = {},
			--['@markup.heading.1.markdown'] = {},
			--['@markup.heading.2.markdown'] = {},
			--['@markup.heading.3.markdown'] = {},
			--['@markup.heading.4.markdown'] = {},
			--['@markup.heading.5.markdown'] = {},
			--['@markup.heading.6.markdown'] = {},
			--['@markup.heading.1.marker.markdown'] = {},
			--['@markup.heading.2.marker.markdown'] = {},
			--['@markup.heading.3.marker.markdown'] = {},
			--['@markup.heading.4.marker.markdown'] = {},
			--['@markup.heading.5.marker.markdown'] = {},
			--['@markup.heading.6.marker.markdown'] = {},
		--['@markup.quote'] = {},
		--['@markup.math'] = {},
		--['@markup.environment'] = {},
			--['@markup.environment.name'] = {},
		--['@markup.link'] not defined
			--['@markup.link.label'] = {},
			--['@markup.link.url'] = {},
		--['@markup.list'] = {},
			--['@markup.list.checked'] = {},
			--['@markup.list.unchecked'] = {},
	--['@function'] defined under basics
		--['@function.method'] = {},
		--['@function.method.call'] = {},
	--['@type'] defined under basics
		['@type.builtin'] = { fg = c['nord9'] },
	--['@module'] = {},
		--['@module.builtin'] = {},
	--['@number'] defined under basics
		--['@number.float'] = {},
	--['@tag'] defined under basics
		--['@tag.attribute'] = {},
		['@tag.delimiter'] = { fg = c['Magenta'] },
	--['@conceal'] = {},
	--['@diff.plus'] = {},
	--['@diff.minus'] = {},
	--['@diff.delta'] = {},
	---- NEW NOT IN ROSE-PINE----
	['@attribute'] = { fg = c['Magenta'] }, -- MISSING FROM ROSE-PINE
	['@error'] = { fg = c['Red'] }, -- MISSING FROM ROSE-PINE
}
M.legacy = {
	--['@attribute.diff'] = {},
	--['@class'] = {},
	--['@interface'] = {},
	--['@regexp'] = {},
	['@symbol'] = { fg = c['Magenta'] },
	--['@text'] defined under basics
		--['@text.danger'] = {},
		--['@text.diff'] not defined
			--['@text.diff.add'] = {},
			--['@text.diff.delete'] = {},
		['@text.emphasis'] = { fg = c['Blue'], italic = ItalicOption },
		--['@text.environment'] = {},
			--['@text.environment.name'] = {},
		['@text.math'] = { fg = c['Cyan'] },
		--['@text.note'] = {},
		['@text.strike'] = { fg = c['nord4'], strikethrough = true },
		--['@text.strong'] = {},
		--['@text.title'] defined under basics
			--['@text.title.1.markdown'] = {},
			--['@text.title.1.marker.markdown'] = {},
			--['@text.title.2.markdown'] = {},
			--['@text.title.2.marker.markdown'] = {},
			--['@text.title.3.markdown'] = {},
			--['@text.title.3.marker.markdown'] = {},
			--['@text.title.4.markdown'] = {},
			--['@text.title.4.marker.markdown'] = {},
			--['@text.title.5.markdown'] = {},
			--['@text.title.5.marker.markdown'] = {},
			--['@text.title.6.markdown'] = {},
			--['@text.title.6.marker.markdown'] = {},
		--['@text.warning'] = {},
	--['@todo'] = {},
}
M.telescope = {
	TelescopeMatching = { link = 'Search' },
	--TelescopeNormal = {},
	--TelescopePromptNormal = {},
	--TelescopePromptPrefix = {},
	TelescopeSelection = { fg = c['White'], bg = c['nord2'] },
	TelescopeSelectionCaret = { fg = c['nord9'] },
	--TelescopeTitle = {},
	TelescopeBorder = { fg = c['nord4'] },
}
M.nvimcmp = {
	CmpItemAbbr = { fg = c['nord4'] },
	--CmpItemAbbrDeprecated = {},
	CmpItemAbbrMatch = { fg = c['nord5'], bold = BoldOption },
	CmpItemAbbrMatchFuzzy = { fg = c['nord5'], bold = BoldOption },
	CmpItemKind = { fg = c['Magenta'] },
	--CmpItemKindClass = {},
	--CmpItemKindFunction = {},
	--CmpItemKindInterface = {},
	--CmpItemKindMethod = {},
	--CmpItemKindSnippet = {},
	--CmpItemKindVariable = {},
	CmpItemMenu = { fg = c['Green'] },
}
M.mason = {
	--MasonNormal = {}, -- Default link: NormalFloat
	--MasonHeader = {},
	--MasonHeaderSecondary = {},
	--MasonHighlight = {},
		--MasonLink = {},
	--MasonHighlightBlock = {},
	--MasonHighlightBlockBold = {},
	--MasonHighlightSecondary = {},
	--MasonHighlightBlockSecondary = {},
	--MasonHighlightBlockBoldSecondary = {},
	--MasonMuted = {},
	--MasonMutedBlock = {},
	--MasonMutedBlockBold = {},
	--MasonError = {}, -- Default link: ErrorMsg
	--MasonWarning = {}, -- Default link: WarningMsg
	--MasonHeading = {},
}
M.yankhighlight = {
	YankHighlight = { fg = c['Black'], bg = c['White'] },
}
M.statusline = {
	StatuslineTextMain = { fg = c['White'], bg = c['Black'] },
	StatuslineTextAccent = { fg = c['BrightBlack'], bg = c['Black'] },
	StatuslineModeNormal = { fg = c['White'], bg = c['BrightBlue'] },
	StatuslineModeInsert = { fg = c['White'], bg = c['BrightCyan'] },
	StatuslineModeVisual = { fg = c['White'], bg = c['BrightYellow'] },
	StatuslineModeReplace = { fg = c['White'], bg = c['BrightRed'] },
	StatuslineModeCommand = { fg = c['White'], bg = c['BrightBlack'] },
	StatuslineModeSelect = { fg = c['White'], bg = c['BrightMagenta'] },
	StatuslineFiletype = { fg = c['White'], bg = c['Black'] },
	StatuslineSaved = { fg = c['White'], bg = c['BrightGreen'] },
	StatuslineNotSaved = { fg = c['White'], bg = c['BrightRed'] },
	StatuslineReadOnly = { fg = c['White'], bg = c['BrightYellow'] },
	StatuslineLspOn = { fg = c['BrightWhite'], bg = c['Black'] },
	StatuslineLspError = { fg = c['Red'], bg = c['Black'] },
	StatuslineLspWarning = { fg = c['Yellow'], bg = c['Black'] },
	StatuslineLspInfo = { fg = c['Blue'], bg = c['Black'] },
	StatuslineLspHint = { fg = c['White'], bg = c['Black'] },
	StatuslineHarpoon = { fg = c['White'], bg = c['BrightMagenta'] },
}

return M