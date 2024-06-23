local M = {}

M.colors = {}
local c = M.colors

c.BG = BaseColor
c.White = HSL(0, 100, 100)
c.Black = HSL(0, 0, 0)
c.Grey1 = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 3)
c.Grey2 = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 7)
c.Grey3 = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 19)
c.Grey4 = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 35)
c.Grey5 = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 54)
c.Grey6 = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 74)
c.Grey7 = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 82)
c.Grey8 = HSL(HSL_H(c.BG), HSL_S(c.BG) / 1.5, 93)
c.Green = HSL(130, 30, 52)
c.Yellow = HSL(30, 50, 60)
c.Magenta = HSL(280, 50, 70)
c.Red1 = HSL(0, 58, 52)
c.Red2 = HSL(0, 100, 42)
c.Red3 = HSL(0, 100, 34)
c.Red4 = HSL(0, 100, 26)
c.ui1 = HSL(HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 2)
c.ui2 = HSL(HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 4)
c.ui3 = HSL(HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 10)
c.ui4 = HSL(HSL_H(c.BG), HSL_S(c.BG), HSL_L(c.BG) + 15)

M.basics = {
	netrwPlain = { fg = c.Grey6 },
	netrwDir = { fg = c.Grey8, bold = BoldOption },
	netrwClassify = { fg = c.Grey8, bold = BoldOption },
	netrwMarkFile = { fg = c.Magenta },
	Normal = { fg = c.Grey6 },
		NormalNC = { link = 'Normal' },
		MsgArea = { link = 'Normal' },
		EndOfBuffer = { link = 'Normal' },
		Delimiter = { link = 'Normal' },
		Identifier = { link = 'Normal' },
		Title = { link = 'Normal' },
		Debug = { link = 'Normal' },
		Boolean = { link = 'Normal' },
		Exception = { link = 'Normal' },
		FoldColumn = { link = 'Normal' },
		Macro = { link = 'Normal' },
		ModeMsg = { link = 'Normal' },
		MoreMsg = { link = 'Normal' },
		Question = { link = 'Normal' },
	NormalFloat = { bg = c.ui1 },
	MsgSeparator = { link = "StatuslineTextMain" },
	Keyword = { fg = c.Grey8, },
		Conditional = { link = 'Keyword' },
		Statement = { link = 'Keyword' },
		Operator = { link = 'Keyword' },
		Structure = { link = 'Keyword' },
		Function = { link = 'Keyword' },
		Include = { link = 'Keyword' },
		Type = { link = 'Keyword' },
		Typedef = { link = 'Keyword' },
		Todo = { link = 'Keyword' },
		Label = { link = 'Keyword' },
		Define = { link = 'Keyword' },
		DiffAdd = { link = 'Keyword' },
		diffAdded = { fg = c.Green },
		diffCommon = { link = 'Keyword' },
		Directory = { link = 'Keyword' },
		PreCondit = { link = 'Keyword' },
		PreProc = { link = 'Keyword' },
		Repeat = { link = 'Keyword' },
		Special = { link = 'Keyword' },
		SpecialChar = { link = 'Keyword' },
		StorageClass = { link = 'Keyword' },
	Constant = { fg = c.Grey5, }, -- Grey5 default
	String = { fg = c.Grey5, },
		SpecialComment = { link = 'String' },
	Whitespace = { fg = c.ui2 },
	Comment = { fg = c.Grey4, italic = ItalicOption },
		NonText = { fg = c.Grey4, },
		DiffDelete = { fg = c.Grey4, },
		diffRemoved = { fg = c.Red1 },
	LineNr = { fg = c.Grey4 },
		LineNrAbove = { link = 'LineNr' },
		LineNrBelow = { link = 'LineNr' },
	CursorLineNr = { fg = c.Grey6 },
	Number = { fg = c.Red1 },
		Character = { link = 'Number' },
		Float = { link = 'Number' },
		Tag = { link = 'Number' },
		Folded = { link = 'Number' },
		WarningMsg = { link = 'Number' },
	Error = { fg = c.Grey8, bg = c.Red4 },
	ErrorMsg = { fg = c.Grey8, bg = c.Red3 },
	Search = { fg = c.Grey1, bg = c.Grey5 },
	IncSearch = { fg = c.Grey1, bg = c.Grey8 },
		Substitute = { link = "IncSearch" },
	DiffChange = { fg = c.Red2, bg = c.Grey8 },
		diffChanged = { link = 'DiffChange' },
	DiffText = { bold = BoldOption, fg = c.Grey6, bg = c.Red1 },
	SignColumn = { fg = c.Red3, bg = c.Grey4 },
	SpellBad = { underline = UnderlineOption, fg = c.Grey8, bg = c.Red4 },
	SpellCap = { fg = c.Grey8, bg = c.Red3 },
		SpellLocal = { link = 'SpellCap' },
	SpellRare = { fg = c.Red3, },
		Underlined = { link = 'SpellRare' },
	WildMenu = { fg = c.Grey4, bg = c.Grey8 },
	Pmenu = { fg = c.Grey8, bg = c.Grey4 },
	PmenuThumb = { fg = c.Grey1, bg = c.Grey4 },
	SpecialKey = { fg = c.Red1 },
	MatchParen = { fg = c.Black, bg = c.Grey4 },
	CursorLine = { bg = c.ui2 },
	StatusLine = { link = 'StatuslineTextMain' },
	WinBar = { link = 'StatuslineTextMain' },
		WinBarNC = { link = 'WinBar' },
		Cursor = { link = 'StatusLine' },
	StatusLineNC = { reverse = true, fg = c.Grey3, bg = c.Black },
	Visual = { bg = c.ui3 },
		PmenuSbar = { link = 'Visual' },
		PmenuSel = { link = 'Visual' },
		VisualNOS = { link = 'Visual' },
		VertSplit = { link = 'Visual' },
	TermCursor = { reverse = true },
}
M.yankhighlight = {
	YankHighlight = { fg = c.Black, bg = c.Grey7 },
}
M.statusline = {
	StatuslineTextMain = { fg = c.Grey8, bg = c.ui4 },
	StatuslineTextAccent = { fg = c.Grey5, bg = c.ui4 },
	StatuslineModeNormal = { fg = c.Grey8, bg = c.ui4, bold = BoldOption },
	StatuslineModeInsert = { fg = c.Grey8, bg = c.ui4, bold = BoldOption },
	StatuslineModeVisual = { fg = c.Grey8, bg = c.ui4, bold = BoldOption },
	StatuslineModeReplace = { fg = c.Grey8, bg = c.ui4, bold = BoldOption },
	StatuslineModeCommand = { fg = c.Grey8, bg = c.ui4, bold = BoldOption },
	StatuslineModeSelect = { fg = c.Grey8, bg = c.ui4, bold = BoldOption },
	StatuslineFiletype = { fg = c.Grey5, bg = c.ui4 },
	StatuslineSaved = { fg = c.Green, bg = c.ui4 },
	StatuslineNotSaved = { fg = c.Red1, bg = c.ui4 },
	StatuslineReadOnly = { fg = c.Yellow, bg = c.ui4 },
	StatuslineLspOn = { fg = c.Grey8, bg = c.ui4 },
	StatuslineLspError = { fg = c.Grey8, bg = c.ui4 },
	StatuslineLspWarning = { fg = c.Grey8, bg = c.ui4 },
	StatuslineLspInfo = { fg = c.Grey8, bg = c.ui4 },
	StatuslineLspHint = { fg = c.Grey8, bg = c.ui4 },
	StatuslineHarpoon = { fg = c.Magenta, bg = c.ui4 },
}
M.treesitter = {
-- IDENTIFIERS
	['@variable'] = { link = 'Identifier' }, -- Default Link: Identifier
		['@variable.builtin'] = { link = '@variable' },
		['@variable.parameter'] = { link = '@variable' },
			['@variable.parameter.builtin'] = { link = '@variable.parameter' },
		['@variable.member'] = { link = '@variable' },
	['@constant'] = { link = 'Constant' }, -- Default Link: Constant
		['@constant.builtin'] = { link = '@constant' }, -- Default Link: Special
		['@constant.macro'] = { link = '@constant' }, -- Default Link: Define
	['@module'] = { link = 'Identifier' },
		['@module.builtin'] = { link = '@module' },
	['@label'] = { link = 'Label' }, -- Default Link: Label
-- LITERALS
	['@string'] = { link = 'Constant' }, -- Default Link: Constant
		['@string.documentation'] = { link = '@string' },
		['@string.regexp'] = { link = '@string' },
		['@string.escape'] = { link = '@string' }, -- Default Link: SpecialChar
		['@string.special'] = { link = '@string' }, -- Default Link: SpecialChar
			['@string.special.symbol'] = { link = '@string.special' },
			['@string.special.url'] = { link = '@string.special' },
			['@string.special.path'] = { link = '@string.special' },
	['@character'] = { link = 'Character' }, -- Default Link: Character
		['@character.special'] = { link = '@character' }, -- Default Link: SpecialChar
	['@boolean'] = { link = 'Boolean' }, -- Default Link: Boolean
	['@number'] = { link = 'Number' }, -- Default Link: Number
		['@number.float'] = { link = '@number' },
-- TYPES
	['@type'] = { link = 'Type' }, -- Default Link: Type
		['@type.builtin'] = { link = '@type' },
		['@type.definition'] = { link = '@type' }, -- Default Link: Typedef
	['@attribute'] = { link = '@type' },
		['@attribute.builtin'] = { link = '@attribute' },
	['@property'] = { link = 'Identifier' }, -- Default Link: Identifier
-- FUNCTIONS
	['@function'] = { link = 'Function' }, -- Default Link: Function
		['@function.builtin'] = { link = '@function' }, -- Default Link: Special
		['@function.call'] = { link = '@function' },
		['@function.macro'] = { link = '@function' }, -- Default Link: Macro
		['@function.method'] = { link = '@function' },
			['@function.method.call'] = { link = '@function.method' },
	['@constructor'] = { link = 'Special' }, -- Default Link: Special
	['@operator'] = { link = 'Operator' }, -- Default Link: Operator
-- KEYWORDS
	['@keyword'] = { link = 'Keyword' }, -- Default Link: Keyword
		['@keyword.coroutine'] = { link = '@keyword' },
		['@keyword.function'] = { link = '@keyword' },
		['@keyword.operator'] = { link = '@keyword' },
		['@keyword.import'] = { link = '@keyword' },
		['@keyword.type'] = { link = '@keyword' },
		['@keyword.modifier'] = { link = '@keyword' },
		['@keyword.repeat'] = { link = '@keyword' },
		['@keyword.return'] = { link = '@keyword' },
		['@keyword.debug'] = { link = '@keyword' },
		['@keyword.exception'] = { link = '@keyword' },
		['@keyword.conditional'] = { link = '@keyword' },
			['@keyword.conditional.ternary'] = { link = '@keyword.conditional' },
		['@keyword.directive'] = { link = '@keyword' },
			['@keyword.directive.define'] = { link = '@keyword.directive' },
-- PUNCTUATION
	['@punctuation'] = { link = 'Delimiter' }, -- Default Link: Delimiter
		['@punctuation.delimiter'] = { link = '@punctuation' },
		['@punctuation.bracket'] = { link = '@punctuation' },
		['@punctuation.special'] = { link = '@punctuation' },
-- COMMENTS
	['@comment'] = { link = 'Comment' }, -- Default Link: Comment
		['@comment.documentation'] = { link = '@comment' },
		['@comment.error'] = { link = '@comment' },
		['@comment.warning'] = { link = '@comment' },
		['@comment.todo'] = { link = '@comment' },
		['@comment.note'] = { link = '@comment' },
-- MARKUP
	['@markup'] = {},
		['@markup.strong'] = { bold = BoldOption },
		['@markup.italic'] = { link = '@markup' },
		['@markup.strikethrough'] = { strikethrough = true },
		['@markup.underline'] = { underline = UnderlineOption },
		['@markup.heading'] = { link = '@markup' },
			['@markup.heading.1'] = { link = '@markup.heading' },
			['@markup.heading.2'] = { link = '@markup.heading' },
			['@markup.heading.3'] = { link = '@markup.heading' },
			['@markup.heading.4'] = { link = '@markup.heading' },
			['@markup.heading.5'] = { link = '@markup.heading' },
			['@markup.heading.6'] = { link = '@markup.heading' },
		['@markup.quote'] = { link = '@markup' },
		['@markup.math'] = { link = '@markup' },
		['@markup.link'] = { link = '@markup' },
			['@markup.link.label'] = { link = '@markup.link' },
			['@markup.link.url'] = { link = '@markup.link' },
		['@markup.raw'] = { link = '@markup' },
			['@markup.raw.block'] = { link = '@markup.raw' },
		['@markup.list'] = { link = '@markup' },
			['@markup.list.checked'] = { link = '@markup.list' },
			['@markup.list.unchecked'] = { link = '@markup.list' },
-- DIFF
	['@diff.plus'] = {},
	['@diff.minus'] = {},
	['@diff.delta'] = {},
-- TAG
	['@tag'] = { link = 'Tag' }, -- Default Link: Tag
		['@tag.builtin'] = { link = '@tag' },
		['@tag.attribute'] = { link = '@tag' },
		['@tag.delimiter'] = { link = '@tag' },
-- SPELL
	['@spell'] = {},
	['@nospell'] = {},
-- OTHER
	['@none'] = {},
	['@conceal'] = {},
}
M.telescope = {
	TelescopeNormal = { fg = c.Grey6 }, -- Default Link: Normal
		TelescopeBorder = { link = 'TelescopeNormal' },
			TelescopePromptBorder = { link = 'TelescopeBorder' },
			TelescopeResultsBorder = { link = 'TelescopeBorder' },
			TelescopePreviewBorder = { link = 'TelescopeBorder' },
			TelescopeTitle = { link = 'TelescopeBorder' },
				TelescopePromptTitle = { link = 'TelescopeTitle' },
				TelescopeResultsTitle = { link = 'TelescopeTitle' },
				TelescopePreviewTitle = { link = 'TelescopeTitle' },
		TelescopePromptNormal = { link = 'TelescopeNormal' },
		TelescopeResultsNormal = { link = 'TelescopeNormal' },
		TelescopePreviewNormal = { link = 'TelescopeNormal' },
			TelescopePreviewMessage = { link = 'TelescopePreviewNormal' },
				TelescopePreviewMessageFillchar = { link = 'TelescopePreviewMessage' },
	TelescopeSelection = { link = 'Visual' }, -- Default Link: Visual
		TelescopeSelectionCaret = { link = 'TelescopeSelection' },
	TelescopeMultiIcon = {}, -- Default Link: Identifier
	TelescopeMultiSelection = { fg = c.Grey8, bold = BoldOption }, -- Default Link: Type
	TelescopeMatching = { fg = c.Grey5 }, -- Default Link: Special
	TelescopePromptPrefix = {}, -- Default Link: Identifier
	TelescopePromptCounter = { link = 'TelescopeResultsComment' }, -- Default Link: NonText
	TelescopeResultsComment = { fg = c.Grey4 }, -- Default Link: Comment
	TelescopeResultsNumber = {}, -- Default Link: Number
	TelescopeResultsIdentifier = {}, -- Default Link: Identifier
	TelescopeResultsLineNr = {}, -- Default Link: LineNr
	TelescopeResultsVariable = {}, -- Default Link: SpecialChar
	TelescopeResultsStruct = {}, -- Default Link: Struct
	TelescopeResultsOperator = {}, -- Default Link: Operator
	TelescopeResultsDiffAdd = {}, -- Default Link: DiffAdd
	TelescopeResultsMethod = {}, -- Default Link: Method
	TelescopeResultsFunction = {}, -- Default Link: Function
	TelescopeResultsField = {}, -- Default Link: Function
	TelescopeResultsConstant = {}, -- Default Link: Constant
	TelescopeResultsClass = {}, -- Default Link: Function
	TelescopeResultsDiffChange = {}, -- Default Link: DiffChange
	TelescopeResultsDiffUntracked = {}, -- Default Link: NonText
	TelescopeResultsDiffDelete = {}, -- Default Link: DiffDelete
	TelescopeResultsSpecialComment = {}, -- Default Link: SpecialComment
	TelescopePreviewSticky = {}, -- Default Link: Keyword
	TelescopePreviewHyphen = {}, -- Default Link: NonText
	TelescopePreviewExecute = {}, -- Default Link: String
	TelescopePreviewWrite = {}, -- Default Link: Statement
	TelescopePreviewRead = {}, -- Default Link: Constant
	TelescopePreviewSocket = {}, -- Default Link: Statement
	TelescopePreviewLink = {}, -- Default Link: Special
	TelescopePreviewBlock = {}, -- Default Link: Constant
	TelescopePreviewDirectory = {}, -- Default Link: Directory
	TelescopePreviewCharDev = {}, -- Default Link: Constant
	TelescopePreviewPipe = {}, -- Default Link: Constant
	TelescopePreviewMatch = {}, -- Default Link: Search
	TelescopePreviewLine = {}, -- Default Link: Visual
	TelescopePreviewSize = {}, -- Default Link: String
	TelescopePreviewDate = {}, -- Default Link: Directory
	TelescopePreviewGroup = {}, -- Default Link: Constant
	TelescopePreviewUser = {}, -- Default Link: Constant
}

return M
