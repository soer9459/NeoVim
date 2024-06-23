local M = {}

M.colors = {}
local c = M.colors

c.BG            = BaseColor
c.Black         = HSL( 250,  20,   6 )
c.Red           = HSL( 343,  76,  68 )
c.Green         = HSL(  97,  56,  66 )
c.Blue          = HSL( 197,  49,  38 )
c.Yellow        = HSL(  35,  88,  72 )
c.Magenta       = HSL( 267,  57,  78 )
c.Cyan          = HSL( 189,  43,  73 )
c.White         = HSL( 245,  50,  91 )
c.BrightBlack   = HSL( 223,  14,  36 )
c.BrightRed     = HSL( 343,  35,  55 )
c.BrightGreen   = HSL(  97,  31,  53 )
c.BrightYellow  = HSL(  35,  55,  51 )
c.BrightBlue    = HSL( 197,  53,  34 )
c.BrightMagenta = HSL( 268,  21,  57 )
c.BrightCyan    = HSL( 189,  30,  48 )
c.BrightWhite   = HSL( 224,  18,  68 )
c.Beige         = HSL(   2,  55,  83 )
c.Surface       = HSL(HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 3 )
c.Overlay       = HSL(HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 6 )
c.Muted         = HSL(HSL_H(c.BG), HSL_S(c.BG) - 5, HSL_L(c.BG) + 20 )
c.Subtle        = HSL(HSL_H(c.BG), HSL_S(c.BG) - 5, HSL_L(c.BG) + 52 )
c.HighlightMed  = HSL(HSL_H(c.BG), HSL_S(c.BG) - 5, HSL_L(c.BG) + 12 )
c.HighlightHigh = HSL(HSL_H(c.BG), HSL_S(c.BG) - 10, HSL_L(c.BG) + 20 )
c.hlStatusline  = HSL(HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 15 )
c.None          = 'NONE'

M.basics = {
	SpecialKey = { fg = c.Cyan },
	EndOfBuffer = { fg = c.Overlay },
	TermCursor = {},
	TermCursorNC = {},
	NonText = { fg = c.Muted },
		Whitespace = { fg = c.Overlay },
	Directory = { fg = c.Cyan, bold = BoldOption },
	ErrorMsg = { fg = c.Red, bold = BoldOption },
	IncSearch = { link = "CurSearch" },
	Search = { fg = c.BG, bg = c.White },
		CurSearch = { fg = c.BG, bg = c.Yellow },
		QuickFixLine = { link = 'Search' },
		Substitute = { link = "IncSearch" },
	MoreMsg = { fg = c.Magenta },
	ModeMsg = { fg = c.Subtle },
	LineNr = { fg = c.Muted },
		LineNrAbove = { link = 'LineNr' },
		LineNrBelow = { link = 'LineNr' },
	CursorLineNr = { fg = c.White, bold = BoldOption },
	SignColumn = { fg = c.White, bg = "NONE" },
		CursorLineSign = { link = 'SignColumn' },
	FoldColumn = { fg = c.Muted },
		CursorLineFold = { link = 'FoldColumn' },
	Question = { fg = c.Yellow },
	StatusLine = { fg = c.Subtle, bg = c.Surface }, --Default BG: Surface
		MsgSeparator = { link = 'StatusLine' },
	StatusLineNC = { fg = c.Muted, bg = Blend(c.Surface, c.BG, 0.6) },
	Title = { fg = c.Cyan, bold = BoldOption },
	Visual = { bg = c.HighlightMed },
	VisualNC = {},
	WarningMsg = { fg = c.Yellow, bold = BoldOption },
	WildMenu = { link = "IncSearch" },
	Folded = { fg = c.White, bg = c.Surface },
	DiffAdd = { bg = Blend(c.Cyan, c.BG, 0.2) },
	DiffChange = { bg = Blend(c.Beige, c.BG, 0.2) },
	DiffDelete = { bg = Blend(c.Red, c.BG, 0.2) },
	DiffText = { bg = Blend(c.Beige, c.BG, 0.2) },
	Conceal = { bg = "NONE" },
	SpellBad = { sp = c.Subtle, undercurl = true },
	SpellCap = { sp = c.Subtle, undercurl = true },
	SpellLocal = { sp = c.Subtle, undercurl = true },
	SpellRare = { sp = c.Subtle, undercurl = true },
	Pmenu = { fg = c.Subtle, bg = c.Surface },
		PmenuKind = { fg = c.Cyan, bg = c.Surface },
		PmenuExtra = { fg = c.Muted, bg = c.Surface },
		NormalFloat = { bg = c.Surface },
	PmenuSel = { fg = c.White, bg = c.Overlay },
		PmenuKindSel = { fg = c.Subtle, bg = c.Overlay },
		PmenuExtraSel = { fg = c.Subtle, bg = c.Overlay },
	PmenuSbar = { bg = c.Surface },
	PmenuThumb = { bg = c.Muted },
	TabLine = { fg = c.Subtle, bg = c.Surface },
	TabLineSel = { fg = c.White, bg = c.Overlay, bold = BoldOption },
	TabLineFill = { bg = c.Surface },
	CursorColumn = { bg = c.Overlay },
	CursorLine = { bg = c.Overlay },
	ColorColumn = { bg = c.Surface },
	NormalNC = { fg = c.White }, --bg = c.BG removed
	MsgArea = {},
	FloatBorder = {},
	WinBar = { link = 'StatuslineTextMain' },
	WinBarNC = { link = 'WinBarNC' },
	Cursor = { fg = c.White, bg = c.HighlightHigh },
	FloatTitle = { link = "Directory" },
	lCursor = {},
	Normal = { fg = c.White }, --bg = c.BG removed
		VertSplit = { fg = c.Muted },
			WinSeparator = { link = 'VertSplit' },
	FloatShadow = {},
	FloatShadowThrough = {},
	RedrawDebugNormal = {},
	RedrawDebugClear = { fg = c.BG, bg = c.Yellow },
	RedrawDebugComposed = { fg = c.BG, bg = c.Blue },
	RedrawDebugRecompose = { fg = c.BG, bg = c.Red },
	Error = { fg = c.Red },
	Todo = {},
	Constant = { fg = c.Yellow },
		String = { link = 'Constant' },
		Character = { link = 'Constant' },
		Number = { link = 'Constant' },
			Float = { link = 'Number' },
		Boolean = { fg = c.Beige },
		--['@lsp.type.enumMember'] = {},
	Identifier = { fg = c.White },
		Function = { fg = c.Beige },
			--['@lsp.type.decorator'] = {},
			--['@lsp.type.function'] = {},
			--['@lsp.type.method'] = {},
		--['@lsp.type.parameter'] = {},
		--['@lsp.type.property'] = {},
		--['@lsp.type.variable'] = {},
	Statement = { fg = c.Blue, bold = BoldOption },
		Conditional = { fg = c.Blue },
		Repeat = { fg = c.Blue },
		Label = { fg = c.Cyan },
		Operator = { fg = c.Subtle },
		Keyword = { fg = c.Blue },
		Exception = { fg = c.Blue },
	PreProc = { fg = c.Magenta },
		Include = { fg = c.Blue },
		Define = { fg = c.Magenta },
		Macro = { fg = c.Magenta },
			--['@lsp.type.macro'] = {},
		PreCondit = { link = 'PreProc' },
	Type = { fg = c.Cyan },
		StorageClass = { link = 'Type' },
		Structure = { link = 'Type' },
			--['@lsp.type.class'] = {},
			--['@lsp.type.enum'] = {},
			--['@lsp.type.interface'] = {},
			--['@lsp.type.namespace'] = {},
			--['@lsp.type.struct'] = {},
		Typedef = { link = 'Type' },
			--['@lsp.type.typeParameter'] = {},
		--['@lsp.type.type'] = {},
	Special = { fg = c.Cyan },
		Tag = { link = 'Special' },
		SpecialChar = { link = 'Special' },
		Delimiter = { fg = c.Subtle },
		SpecialComment = { fg = c.Magenta },
		Debug = { fg = c.Beige },
	DiagnosticError = { fg = c.Red },
		DiagnosticVirtualTextError = { fg = c.Red, bg = Blend(c.Red, c.BG, 0.1) },
		DiagnosticFloatingError = { link = 'DiagnosticError' },
		DiagnosticSignError = { link = 'DiagnosticError' },
	DiagnosticWarn = { fg = c.Yellow },
		DiagnosticVirtualTextWarn = { fg = c.Yellow, bg = Blend(c.Yellow, c.BG, 0.1) },
		DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
		DiagnosticSignWarn = { link = 'DiagnosticWarn' },
	DiagnosticInfo = { fg = c.Cyan },
		DiagnosticVirtualTextInfo = { fg = c.Cyan, bg = Blend(c.Cyan, c.BG, 0.1) },
		DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
		DiagnosticSignInfo = { link = 'DiagnosticInfo' },
	DiagnosticHint = { fg = c.White },
		DiagnosticVirtualTextHint = { fg = c.White, bg = Blend(c.White, c.BG, 0.1) },
		DiagnosticFloatingHint = { link = 'DiagnosticHint' },
		DiagnosticSignHint = { link = 'DiagnosticHint' },
	DiagnosticOk = { fg = c.Green },
		DiagnosticVirtualTextOk = { fg = c.Green, bg = Blend(c.Green, c.BG, 0.1) },
		DiagnosticFloatingOk = { link = 'DiagnosticOk' },
		DiagnosticSignOk = { link = 'DiagnosticOk' },
	DiagnosticUnderlineError = { sp = c.Red, undercurl = true },
	DiagnosticUnderlineHint = { sp = c.Magenta, undercurl = true },
	DiagnosticUnderlineInfo = { sp = c.Cyan, undercurl = true },
	DiagnosticUnderlineWarn = { sp = c.Yellow, undercurl = true },
	DiagnosticUnderlineOk = {},
	DiagnosticDeprecated = {},
	Comment = { fg = c.Subtle, italic = ItalicOption },
		DiagnosticUnnecessary = { link = 'Comment' },
		--['@lsp.type.comment'] = {},
	Underlined = { fg = c.Magenta, underline = UnderlineOption },
	--['@lsp'] = {},
	MatchParen = { fg = c.Blue, bg = Blend(c.Blue, c.BG, 0.25) },
	Ignore = {},
-- NEWLY ADDED
	Added = {},
	Changed = {},
	Removed = {},
	CursorIM = {},
	FloatFooter = {},
	LspCodeLens = {},
	LspCodeLensSeparator = {},
	LspInlayHint = {},
	LspReferenceRead = {},
	LspReferenceText = {},
	LspReferenceWrite = {},
	LspInfoBorder = {},
	LspInfoFiletype = {},
	LspInfoTitle = {},
	LspInfoTip = {},
	LspInfoList = {},
	LspSignatureActiveParameter = {},
	SnippetTabStop = {},
	diffAdded = { fg = c.Green },
	diffRemoved = { fg = c.Red },
	diffChanged = { fg = c.Magenta },
	diffText = { fg = c.Cyan },
}
M.treesitter = {
-- IDENTIFIERS
	['@variable'] = { fg = c.White, italic = ItalicOption }, -- Default Link: Identifier
		['@variable.builtin'] = { fg = c.Red, bold = BoldOption },
		['@variable.parameter'] = { fg = c.Magenta, italic = ItalicOption },
			['@variable.parameter.builtin'] = { link = '@variable.parameter' },
		['@variable.member'] = { fg = c.Cyan },
	['@constant'] = { link = 'Constant' }, -- Default Link: Constant
		['@constant.builtin'] = { fg = c.Yellow, bold = BoldOption }, -- Default Link: Special
		['@constant.macro'] = { fg = c.Yellow }, -- Default Link: Define
	['@module'] = { fg = c.White },
		['@module.builtin'] = { fg = c.White, bold = BoldOption },
	['@label'] = { link = 'Label' }, -- Default Link: Label
-- LITERALS
	['@string'] = { link = 'Constant' }, -- DEFAULT LINK: Constant
		['@string.documentation'] = { link = '@string' },
		['@string.regexp'] = { fg = c.Magenta },
		['@string.escape'] = { fg = c.Blue }, -- DEFAULT LINK: SpecialChar
		['@string.special'] = { link = "String" }, -- Default Link: SpecialChar
			['@string.special.symbol'] = { link = "Identifier" },
			['@string.special.url'] = { fg = c.Magenta },
			['@string.special.path'] = { link = '@string.special' },
	['@character'] = { link = 'Character' }, -- DEFAULT LINK: Character
		['@character.special'] = { link = "Character" }, -- Default Link: SpecialChar
	['@boolean'] = { link = 'Boolean' }, -- Default Link: Boolean
	['@number'] = { link = 'Number' }, -- DEFAULT LINK: Number
		['@number.float'] = { link = "Number" },
-- TYPES
	['@type'] = { link = 'Type' }, -- Default Link: Type
		['@type.builtin'] = { fg = c.Cyan, bold = BoldOption },
		['@type.definition'] = { link = '@type' }, -- Default Link: Typedef
	['@attribute'] = {},
		['@attribute.builtin'] = { link = '@attribute' },
	['@property'] = { fg = c.Cyan, italic = ItalicOption }, -- Default Link: Identifier
-- FUNCTIONS
	['@function'] = { link = 'Function' }, -- Default Link: Function
		['@function.builtin'] = { fg = c.Beige, bold = BoldOption }, -- Default Link: Special
		['@function.call'] = { link = '@function' },
		['@function.macro'] = { link = "Function" }, -- Default Link: Macro
		['@function.method'] = { fg = c.Beige },
			['@function.method.call'] = { fg = c.Magenta },
	['@constructor'] = { link = 'Special' }, -- DEFAULT LINK: Special
	['@operator'] = { link = 'Operator' }, -- Default Link: Operator
-- KEYWORDS
	['@keyword'] = { link = 'Keyword' }, -- Default Link: Keyword
		['@keyword.coroutine'] = { link = '@keyword' },
		['@keyword.function'] = { link = '@keyword' },
		['@keyword.operator'] = { fg = c.Subtle },
		['@keyword.import'] = { fg = c.Blue },
		['@keyword.type'] = { link = '@keyword' },
		['@keyword.modifier'] = { link = '@keyword' },
		['@keyword.repeat'] = { fg = c.Blue },
		['@keyword.return'] = { fg = c.Blue },
		['@keyword.debug'] = { fg = c.Beige },
		['@keyword.exception'] = { fg = c.Blue },
		['@keyword.conditional'] = { fg = c.Blue },
			['@keyword.conditional.ternary'] = { link = '@keyword.conditional' },
		['@keyword.directive'] = { fg = c.Magenta },
			['@keyword.directive.define'] = { link = '@keyword.directive' },
-- PUNCTUATION
	['@punctuation'] = { link = 'Delimiter' }, -- Default Link: Delimiter
		['@punctuation.delimiter'] = { fg = c.Subtle },
		['@punctuation.bracket'] = { fg = c.Subtle },
		['@punctuation.special'] = { fg = c.Subtle },
-- COMMENTS
	['@comment'] = { link = 'Comment' }, -- DEFAULT LINK: Comment
		['@comment.documentation'] = { link = '@comment' },
		['@comment.error'] = { fg = c.Red },
		['@comment.warning'] = { fg = c.Yellow },
		['@comment.todo'] = { fg = c.Beige, bg = Blend(c.Beige, c.BG, 0.2) },
		['@comment.note'] = { fg = c.Blue, bg = Blend(c.Blue, c.BG, 0.2) },
-- MARKUP
	['@markup'] = {},
		['@markup.strong'] = { bold = BoldOption },
		['@markup.italic'] = { italic = ItalicOption },
		['@markup.strikethrough'] = { strikethrough = true },
		['@markup.underline'] = { underline = UnderlineOption },
		['@markup.heading'] = { fg = c.Cyan, bold = BoldOption },
			['@markup.heading.1'] = { fg = c.Magenta, bold = BoldOption },
			['@markup.heading.2'] = { fg = c.Cyan, bold = BoldOption },
			['@markup.heading.3'] = { fg = c.Beige, bold = BoldOption },
			['@markup.heading.4'] = { fg = c.Yellow, bold = BoldOption },
			['@markup.heading.5'] = { fg = c.Blue, bold = BoldOption },
			['@markup.heading.6'] = { fg = c.Cyan, bold = BoldOption },
		['@markup.quote'] = { fg = c.Subtle },
		['@markup.math'] = { link = "Special" },
		['@markup.link'] = { link = '@markup' },
			['@markup.link.label'] = { fg = c.White },
			['@markup.link.url'] = { fg = c.Magenta },
		['@markup.raw'] = { link = '@markup' },
			['@markup.raw.block'] = { link = '@markup.raw' },
		['@markup.list'] = { fg = c.White },
			['@markup.list.checked'] = { fg = c.Cyan, bg = Blend(c.Cyan, c.BG, 0.1) },
			['@markup.list.unchecked'] = { link = '@markup.list' },
-- DIFF
	['@diff.plus'] = { fg = c.Cyan, bg = Blend(c.Cyan, c.BG, 0.2) },
	['@diff.minus'] = { fg = c.Red, bg = Blend(c.Red, c.BG, 0.2) },
	['@diff.delta'] = { bg = Blend(c.Beige, c.BG, 0.2) },
-- TAG
	['@tag'] = { link = 'Tag' }, -- Default Link: Tag
		['@tag.builtin'] = { link = '@tag' },
		['@tag.attribute'] = { fg = c.Magenta },
		['@tag.delimiter'] = { fg = c.Subtle },
-- SPELL
	['@spell'] = {},
	['@nospell'] = {},
-- OTHER
	['@none'] = {},
	['@conceal'] = { link = "Conceal" },
}
M.telescope = {
	TelescopeNormal = { bg = c.BG }, -- Default link: Normal (default bg: rose-pine surface)
		TelescopeBorder = { fg = c.Subtle, bg = c.BG }, -- (default bg: rose-pine surface)
			TelescopePromptBorder = { link = 'TelescopeBorder' },
			TelescopeResultsBorder = { link = 'TelescopeBorder' },
			TelescopePreviewBorder = { link = 'TelescopeBorder' },
			TelescopeTitle = { fg = c.Cyan, bold = BoldOption },
				TelescopePromptTitle = { link = 'TelescopeTitle' },
				TelescopeResultsTitle = { link = 'TelescopeTitle' },
				TelescopePreviewTitle = { link = 'TelescopeTitle' },
		TelescopePromptNormal = { link = 'TelescopeNormal' },
		TelescopeResultsNormal = { link = 'TelescopeNormal' },
		TelescopePreviewNormal = { link = 'TelescopeNormal' },
			TelescopePreviewMessage = { link = 'TelescopePreviewNormal' },
				TelescopePreviewMessageFillchar = { fg = c.Muted },
	TelescopeSelection = { fg = c.White, bg = c.Overlay }, -- Default link: Visual
		TelescopeSelectionCaret = { fg = c.Beige, bg = c.Overlay },
	TelescopeMultiIcon = { link = 'Identifier' }, -- Default link: Identifier
	TelescopeMultiSelection = { link = 'Type' }, -- Default link: Type
	TelescopeMatching = { fg = c.Beige }, -- Default link: Special
	TelescopePromptPrefix = { fg = c.Subtle }, -- Default link: Identifier
	TelescopePromptCounter = { link = 'NonText' }, -- Default link: NonText
	TelescopeResultsComment = { link = 'Comment' }, -- Default link: Comment
	TelescopeResultsNumber = { link = 'Number' }, -- Default link: Number
	TelescopeResultsIdentifier = { link = 'Identifier' }, -- Default link: Identifier
	TelescopeResultsLineNr = { link = 'LineNr' }, -- Default link: LineNr
	TelescopeResultsVariable = { link = 'SpecialChar' }, -- Default link: SpecialChar
	TelescopeResultsStruct = { link = 'Struct' }, -- Default link: Struct
	TelescopeResultsOperator = { link = 'Operator' }, -- Default link: Operator
	TelescopeResultsDiffAdd = { link = 'DiffAdd' }, -- Default link: DiffAdd
	TelescopeResultsMethod = { link = 'Method' }, -- Default link: Method
	TelescopeResultsFunction = { link = 'Function' }, -- Default link: Function
	TelescopeResultsField = { link = 'Function' }, -- Default link: Function
	TelescopeResultsConstant = { link = 'Constant' }, -- Default link: Constant
	TelescopeResultsClass = { link = 'Function' }, -- Default link: Function
	TelescopeResultsDiffChange = { link = 'DiffChange' }, -- Default link: DiffChange
	TelescopeResultsSpecialComment = { link = 'SpecialComment' }, -- Default link: SpecialComment
	TelescopePreviewSticky = { link = 'Keyword' }, -- Default link: Keyword
	TelescopePreviewHyphen = { link = 'NonText' }, -- Default link: NonText
	TelescopePreviewExecute = { link = 'String' }, -- Default link: String
	TelescopePreviewWrite = { link = 'Statement' }, -- Default link: Statement
	TelescopePreviewRead = { link = 'Constant' }, -- Default link: Constant
	TelescopePreviewSocket = { link = 'Statement' }, -- Default link: Statement
	TelescopePreviewLink = { link = 'Special' }, -- Default link: Special
	TelescopePreviewBlock = { link = 'Constant' }, -- Default link: Constant
	TelescopePreviewDirectory = { link = 'Directory' }, -- Default link: Directory
	TelescopePreviewCharDev = { link = 'Constant' }, -- Default link: Constant
	TelescopePreviewPipe = { link = 'Constant' }, -- Default link: Constant
	TelescopePreviewMatch = { link = 'Search' }, -- Default link: Search
	TelescopePreviewLine = { link = 'Visual' }, -- Default link: Visual
	TelescopeResultsDiffUntracked = { link = 'NonText' }, -- Default link: NonText
	TelescopeResultsDiffDelete = { link = 'DiffDelete' }, -- Default link: DiffDelete
	TelescopePreviewSize = { link = 'String' }, -- Default link: String
	TelescopePreviewDate = { link = 'Directory' }, -- Default link: Directory
	TelescopePreviewGroup = { link = 'Constant' }, -- Default link: Constant
	TelescopePreviewUser = { link = 'Constant' }, -- Default link: Constant
}
M.nvimcmp = {
	CmpItemAbbr = { fg = c.Subtle },
	CmpItemAbbrDeprecated = { fg = c.Subtle, strikethrough = true },
	CmpItemAbbrMatch = { fg = c.White, bold = BoldOption },
	CmpItemAbbrMatchFuzzy = { fg = c.White, bold = BoldOption },
	CmpItemKind = { fg = c.Subtle },
	CmpItemKindClass = { link = "StorageClass" },
	CmpItemKindFunction = { link = "Function" },
	CmpItemKindInterface = { link = "Type" },
	CmpItemKindMethod = { link = "PreProc" },
	CmpItemKindSnippet = { link = "String" },
	CmpItemKindVariable = { link = "Identifier" },
}
M.yankhighlight = {
	YankHighlight = { fg = c.Black, bg = c.White },
}
M.statusline = {
	StatuslineTextMain = { fg = c.White, bg = c.hlStatusline },
	StatuslineTextAccent = { fg = c.BrightWhite, bg = c.hlStatusline },
	StatuslineModeNormal = { fg = c.White, bg = c.hlStatusline, bold = BoldOption },
	StatuslineModeInsert = { fg = c.White, bg = c.hlStatusline, bold = BoldOption },
	StatuslineModeVisual = { fg = c.White, bg = c.hlStatusline, bold = BoldOption },
	StatuslineModeReplace = { fg = c.White, bg = c.hlStatusline, bold = BoldOption },
	StatuslineModeCommand = { fg = c.White, bg = c.hlStatusline, bold = BoldOption },
	StatuslineModeSelect = { fg = c.White, bg = c.hlStatusline, bold = BoldOption },
	StatuslineFiletype = { fg = c.White, bg = c.hlStatusline },
	StatuslineSaved = { fg = c.Green, bg = c.hlStatusline },
	StatuslineNotSaved = { fg = c.Red, bg = c.hlStatusline },
	StatuslineReadOnly = { fg = c.Yellow, bg = c.hlStatusline },
	StatuslineLspOn = { fg = c.BrightWhite, bg = c.hlStatusline },
	StatuslineLspError = { fg = c.Red, bg = c.hlStatusline },
	StatuslineLspWarning = { fg = c.Yellow, bg = c.hlStatusline },
	StatuslineLspInfo = { fg = c.Blue, bg = c.hlStatusline },
	StatuslineLspHint = { fg = c.White, bg = c.hlStatusline },
	StatuslineHarpoon = { fg = c.Magenta, bg = c.hlStatusline },
}

return M
