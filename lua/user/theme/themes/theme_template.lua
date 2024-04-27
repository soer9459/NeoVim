local M = {}

M.colors = {
	-- BACKGROUND COLOR
	BackgroundColor = BackgroundColor,
	-- TERMINAL COLORS
	Black = "",
	Red = "",
	Green = "",
	Blue = "",
	Yellow = "",
	Magenta = "",
	Cyan = "",
	White = "",
	BrightBlack = "",
	BrightRed = "",
	BrightGreen = "",
	BrightYellow = "",
	BrightBlue = "",
	BrightMagenta = "",
	BrightCyan = "",
	BrightWhite = "",
	-- OTHER COLORS
	Beige = "",
}

local c = M.colors

M.basic = {
	SpecialKey = {},
	TermCursor = {},
	TermCursorNC = {},
	NonText = {},
		EndOfBuffer = {},
		Whitespace = {},
	Directory = {},
	ErrorMsg = {},
	IncSearch = {},
	Search = {},
		CurSearch = {},
		QuickFixLine = {},
		Substitute = {},
	MoreMsg = {},
	ModeMsg = {},
	LineNr = {},
		LineNrAbove = {},
		LineNrBelow = {},
	CursorLineNr = {},
	Question = {},
	StatusLine = {},
		MsgSeparator = {},
	StatusLineNC = {},
	Title = {},
		FloatTitle = {},
	Visual = {},
	VisualNC = {},
	WarningMsg = {},
	WildMenu = {},
	Folded = {},
	FoldColumn = {},
		CursorLineFold = {},
	DiffAdd = {},
	DiffChange = {},
	DiffDelete = {},
	DiffText = {},
	SignColumn = {},
		CursorLineSign = {},
	Conceal = {},
	SpellBad = {},
	SpellCap = {},
	SpellRare = {},
	SpellLocal = {},
	Pmenu = {},
		PmenuKind = {},
		PmenuExtra = {},
		NormalFloat = {},
	PmenuSel = {},
		PmenuKindSel = {},
		PmenuExtraSel = {},
	PmenuSbar = {},
	PmenuThumb = {},
	TabLine = {},
	TabLineSel = {},
	TabLineFill = {},
	CursorColumn = {},
	CursorLine = {},
	ColorColumn = {},
	NormalNC = {},
	MsgArea = {},
	WinBar = {},
		WinBarNC = {},
	Cursor = {},
	lCursor = {},
	Normal = {},
		VertSplit = {},
			WinSeparator = {},
				FloatBorder = {},
	FloatShadow = {},
	FloatShadowThrough = {},
	RedrawDebugNormal = {},
	RedrawDebugClear = {},
	RedrawDebugComposed = {},
	RedrawDebugRecompose = {},
	Error = {},
	Todo = {},
	Constant = {},
		String = {},
		Character = {},
		Number = {},
			Float = {},
		Boolean = {},
	Identifier = {},
		Function = {},
	Statement = {},
		Conditional = {},
		Repeat = {},
		Label = {},
		Operator = {},
		Keyword = {},
		Exception = {},
	PreProc = {},
		Include = {},
		Define = {},
		Macro = {},
		PreCondit = {},
	Type = {},
		StorageClass = {},
		Structure = {},
		Typedef = {},
	Special = {},
		Tag = {},
		SpecialChar = {},
		Delimiter = {},
		SpecialComment = {},
		Debug = {},
	Comment = {},
	Underlined = {},
	MatchParen = {},
	Ignore = {},
}
M.diagnostic = { -- NOT DONE
	DiagnosticError = {},
		DiagnosticVirtualTextError = {},
		DiagnosticFloatingError = {},
		DiagnosticSignError = {},
	DiagnosticWarn = {},
		DiagnosticVirtualTextWarn = {},
		DiagnosticFloatingWarn = {},
		DiagnosticSignWarn = {},
	DiagnosticInfo = {},
		DiagnosticVirtualTextInfo = {},
		DiagnosticFloatingInfo = {},
		DiagnosticSignInfo = {},
	DiagnosticHint = {},
		DiagnosticVirtualTextHint = {},
		DiagnosticFloatingHint = {},
		DiagnosticSignHint = {},
	DiagnosticOk = {},
		DiagnosticVirtualTextOk = {},
		DiagnosticFloatingOk = {},
		DiagnosticSignOk = {},
	DiagnosticUnderlineError = {},
	DiagnosticUnderlineWarn = {},
	DiagnosticUnderlineInfo = {},
	DiagnosticUnderlineHint = {},
	DiagnosticUnderlineOk = {},
	DiagnosticDeprecated = {},
	DiagnosticUnnecessary = {}, -- Default link: Comment
}
M.treesitter = { -- NOT DONE
	['@text.literal'] = {}, -- Default link: Comment
	['@comment'] = {}, -- Default link: Comment
	['@text'] = {},
	['@text.reference'] = {}, -- Default link: Identifier
	['@text.title'] = {}, -- Default link: Title
	['@text.uri'] = {}, -- Default link: Underlined
	['@text.underline'] = {}, -- Default link: Underlined
	['@text.todo'] = {}, -- Default link: Todo
	['@punctuation'] = {}, -- Default link: Delimiter
	['@constant'] = {}, -- Default link: Constant
	['@constant.builtin'] = {}, -- Default link: Special
	['@constant.macro'] = {}, -- Default link: Define
	['@define'] = {}, -- Default link: Define
	['@macro'] = {}, -- Default link: Macro
	['@string'] = {}, -- Default link: String
	['@string.escape'] = {}, -- Default link: SpecialChar
	['@string.special'] = {}, -- Default link: SpecialChar
	['@character'] = {}, -- Default link: Character
	['@character.special'] = {}, -- Default link: SpecialChar
	['@number'] = {}, -- Default link: Number
	['@boolean'] = {}, -- Default link: Boolean
	['@float'] = {}, -- Default link: Float
	['@function'] = {}, -- Default link: Function
	['@function.builtin'] = {}, -- Default link: Special
	['@function.macro'] = {}, -- Default link: Macro
	['@parameter'] = {}, -- Default link: Identifier
	['@method'] = {}, -- Default link: Function
	['@field'] = {}, -- Default link: Identifier
	['@property'] = {}, -- Default link: Identifier
	['@constructor'] = {}, -- Default link: Special
	['@conditional'] = {}, -- Default link: Conditional
	['@repeat'] = {}, -- Default link: Repeat
	['@label'] = {}, -- Default link: Label
	['@operator'] = {}, -- Default link: Operator
	['@keyword'] = {}, -- Default link: Keyword
	['@exception'] = {}, -- Default link: Exception
	['@variable'] = {}, -- Default link: Identifier
	['@type'] = {}, -- Default link: Type
	['@type.definition'] = {}, -- Default link: Typedef
	['@storageclass'] = {}, -- Default link: StorageClass
	['@namespace'] = {}, -- Default link: Identifier
	['@include'] = {}, -- Default link: Include
	['@preproc'] = {}, -- Default link: PreProc
	['@debug'] = {}, -- Default link: Debug
	['@tag'] = {}, -- Default link: Tag
}
M.lsp = { -- NOT DONE
	['@lsp'] = {},
	['@lsp.type.class'] = {}, -- Default link: Structure
	['@lsp.type.comment'] = {}, -- Default link: Comment
	['@lsp.type.decorator'] = {}, -- Default link: Function
	['@lsp.type.enum'] = {}, -- Default link: Structure
	['@lsp.type.enumMember'] = {}, -- Default link: Constant
	['@lsp.type.function'] = {}, -- Default link: Function
	['@lsp.type.interface'] = {}, -- Default link: Structure
	['@lsp.type.macro'] = {}, -- Default link: Macro
	['@lsp.type.method'] = {}, -- Default link: Function
	['@lsp.type.namespace'] = {}, -- Default link: Structure
	['@lsp.type.parameter'] = {}, -- Default link: Identifier
	['@lsp.type.property'] = {}, -- Default link: Identifier
	['@lsp.type.struct'] = {}, -- Default link: Structure
	['@lsp.type.type'] = {}, -- Default link: Type
	['@lsp.type.typeParameter'] = {}, -- Default link: Typedef
	['@lsp.type.variable'] = {}, -- Default link: Identifier
}
M.nvim = {
	NvimInternalError = {},
		NvimFigureBrace = {},
		NvimSingleQuotedUnknownEscape = {},
		NvimInvalidSingleQuotedUnknownEscape = {},
	NvimAssignment = {}, -- Default link: Operator
		NvimPlainAssignment = {},
		NvimAugmentedAssignment = {},
			NvimAssignmentWithAddition = {},
			NvimAssignmentWithSubtraction = {},
			NvimAssignmentWithConcatenation = {},
	NvimOperator = {}, -- Default link: Operator
		NvimUnaryOperator = {},
			NvimUnaryPlus = {},
			NvimUnaryMinus = {},
			NvimNot = {},
		NvimBinaryOperator = {},
			NvimComparison = {},
				NvimComparisonModifier = {},
			NvimBinaryPlus = {},
			NvimBinaryMinus = {},
			NvimConcat = {},
				NvimConcatOrSubscript = {},
			NvimOr = {},
			NvimAnd = {},
			NvimMultiplication = {},
			NvimDivision = {},
			NvimMod = {},
		NvimTernary = {},
			NvimTernaryColon = {},
	NvimParenthesis = {}, -- Default link: Delimiter
		NvimLambda = {},
		NvimNestingParenthesis = {},
		NvimCallingParenthesis = {},
		NvimSubscript = {},
			NvimSubscriptBracket = {},
			NvimSubscriptColon = {},
			NvimCurly = {},
		NvimContainer = {},
			NvimDict = {},
			NvimList = {},
	NvimIdentifier = {}, -- Default link: Identifier
		NvimIdentifierScope = {},
			NvimOptionScope = {},
		NvimIdentifierScopeDelimiter = {},
			NvimOptionScopeDelimiter = {},
		NvimIdentifierName = {},
		NvimIdentifierKey = {},
		NvimOptionName = {},
		NvimEnvironmentName = {},
	NvimColon = {}, -- Default link: Delimiter
	NvimComma = {}, -- Default link: Delimiter
	NvimArrow = {}, -- Default link: Delimiter
	NvimRegister = {}, -- Default link: SpecialChar
	NvimNumber = {}, -- Default link: Number
		NvimFloat = {},
	NvimNumberPrefix = {}, -- Default link: Type
	NvimOptionSigil = {}, -- Default link: Type
		NvimEnvironmentSigil = {},
	NvimString = {}, -- Default link: String
		NvimStringBody = {},
			NvimSingleQuotedBody = {},
			NvimDoubleQuotedBody = {},
			NvimInvalidStringBody = {},
				NvimInvalidSingleQuotedBody = {},
				NvimInvalidDoubleQuotedBody = {},
		NvimStringQuote = {},
			NvimSingleQuote = {},
			NvimDoubleQuote = {},
	NvimStringSpecial = {}, -- Default link: SpecialChar
		NvimSingleQuotedQuote = {},
		NvimDoubleQuotedEscape = {},
		NvimInvalidStringSpecial = {},
			NvimInvalidSingleQuotedQuote = {},
			NvimInvalidDoubleQuotedEscape = {},
	NvimSpacing = {}, -- Default link: Normal
	NvimInvalid = {}, -- Default link: Error
		NvimInvalidAssignment = {},
			NvimInvalidPlainAssignment = {},
			NvimInvalidAugmentedAssignment = {},
				NvimInvalidAssignmentWithAddition = {},
				NvimInvalidAssignmentWithSubtraction = {},
				NvimInvalidAssignmentWithConcatenation = {},
		NvimInvalidOperator = {},
			NvimInvalidUnaryOperator = {},
				NvimInvalidUnaryPlus = {},
				NvimInvalidUnaryMinus = {},
				NvimInvalidNot = {},
			NvimInvalidBinaryOperator = {},
				NvimInvalidComparison = {},
					NvimInvalidComparisonModifier = {},
				NvimInvalidBinaryPlus = {},
				NvimInvalidBinaryMinus = {},
				NvimInvalidConcat = {},
					NvimInvalidConcatOrSubscript = {},
				NvimInvalidOr = {},
				NvimInvalidAnd = {},
				NvimInvalidMultiplication = {},
				NvimInvalidDivision = {},
				NvimInvalidMod = {},
			NvimInvalidTernary = {},
				NvimInvalidTernaryColon = {},
		NvimInvalidDelimiter = {},
			NvimInvalidParenthesis = {},
				NvimInvalidLambda = {},
				NvimInvalidNestingParenthesis = {},
				NvimInvalidCallingParenthesis = {},
				NvimInvalidSubscript = {},
					NvimInvalidSubscriptBracket = {},
					NvimInvalidSubscriptColon = {},
					NvimInvalidCurly = {},
				NvimInvalidContainer = {},
					NvimInvalidDict = {},
					NvimInvalidList = {},
			NvimInvalidColon = {},
			NvimInvalidComma = {},
			NvimInvalidArrow = {},
			NvimInvalidFigureBrace = {},
		NvimInvalidValue = {},
			NvimInvalidIdentifier = {},
				NvimInvalidIdentifierScope = {},
					NvimInvalidOptionScope = {},
				NvimInvalidIdentifierScopeDelimiter = {},
					NvimInvalidOptionScopeDelimiter = {},
				NvimInvalidIdentifierName = {},
				NvimInvalidIdentifierKey = {},
				NvimInvalidOptionSigil = {},
					NvimInvalidEnvironmentSigil = {},
				NvimInvalidOptionName = {},
				NvimInvalidEnvironmentName = {},
			NvimInvalidRegister = {},
			NvimInvalidNumber = {},
				NvimInvalidFloat = {},
				NvimInvalidNumberPrefix = {},
			NvimInvalidString = {},
				NvimInvalidStringQuote = {},
					NvimInvalidSingleQuote = {},
					NvimInvalidDoubleQuote = {},
			NvimDoubleQuotedUnknownEscape = {},
			NvimInvalidDoubleQuotedUnknownEscape = {},
	NvimInvalidSpacing = {}, -- Default link: ErrorMsg
}
M.nvimcmp = { -- NOT DONE -- LINKS TO PMENU
	CmpItemAbbrDefault = {}, -- MUST BE LINKING SOMEWHERE
		CmpItemAbbr = {},
	CmpItemAbbrDeprecatedDefault = {}, -- MUST BE LINKING SOMEWHERE
		CmpItemAbbrDeprecated = {},
	CmpItemAbbrMatchDefault = {}, -- MUST BE LINKING SOMEWHERE
		CmpItemAbbrMatch = {},
	CmpItemMenuDefault = {}, -- MUST LINK SOMEWHERE
	CmpItemAbbrMatchFuzzyDefault = {}, -- MUST LINK SOMEWHERE
		CmpItemAbbrMatchFuzzy = {},
	CmpItemKindDefault = {}, -- MUST BE LINKING SOMEWHERE
		CmpItemMenu = {},
		CmpItemKind = {},
			CmpItemKindClassDefault = {},
				CmpItemKindClass = {},
			CmpItemKindVariableDefault = {},
				CmpItemKindVariable = {},
			CmpItemKindPropertyDefault = {},
				CmpItemKindProperty = {},
			CmpItemKindFieldDefault = {},
				CmpItemKindField = {},
			CmpItemKindTextDefault = {},
				CmpItemKindText = {},
			CmpItemKindMethodDefault = {},
				CmpItemKindMethod = {},
			CmpItemKindFunctionDefault = {},
				CmpItemKindFunction = {},
			CmpItemKindFolderDefault = {},
				CmpItemKindFolder = {},
			CmpItemKindReferenceDefault = {},
				CmpItemKindReference = {},
			CmpItemKindConstantDefault = {},
				CmpItemKindConstant = {},
			CmpItemKindUnitDefault = {},
				CmpItemKindUnit = {},
			CmpItemKindValueDefault = {},
				CmpItemKindValue = {},
			CmpItemKindColorDefault = {},
				CmpItemKindColor = {},
			CmpItemKindSnippetDefault = {},
				CmpItemKindSnippet = {},
			CmpItemKindStructDefault = {},
				CmpItemKindStruct = {},
			CmpItemKindInterfaceDefault = {},
				CmpItemKindInterface = {},
			CmpItemKindConstructorDefault = {},
				CmpItemKindConstructor = {},
			CmpItemKindKeywordDefault = {},
				CmpItemKindKeyword = {},
			CmpItemKindTypeParameterDefault = {},
				CmpItemKindTypeParameter = {},
			CmpItemKindEventDefault = {},
				CmpItemKindEvent = {},
			CmpItemKindOperatorDefault = {},
				CmpItemKindOperator = {},
			CmpItemKindFileDefault = {},
				CmpItemKindFile = {},
			CmpItemKindEnumMemberDefault = {},
				CmpItemKindEnumMember = {},
			CmpItemKindEnumDefault = {},
				CmpItemKindEnum = {},
			CmpItemKindModuleDefault = {},
				CmpItemKindModule = {},
}
M.telescope = {
	TelescopeNormal = {}, -- Default link: Normal
		TelescopeBorder = {},
			TelescopePromptBorder = {},
			TelescopeResultsBorder = {},
			TelescopePreviewBorder = {},
			TelescopeTitle = {},
				TelescopePromptTitle = {},
				TelescopeResultsTitle = {},
				TelescopePreviewTitle = {},
		TelescopePromptNormal = {},
		TelescopeResultsNormal = {},
		TelescopePreviewNormal = {},
			TelescopePreviewMessage = {},
				TelescopePreviewMessageFillchar = {},
	TelescopeSelection = {}, -- Default link: Visual
		TelescopeSelectionCaret = {},
	TelescopeMultiIcon = {}, -- Default link: Identifier
	TelescopeMultiSelection = {}, -- Default link: Type
	TelescopeMatching = {}, -- Default link: Special
	TelescopePromptPrefix = {}, -- Default link: Identifier
	TelescopePromptCounter = {}, -- Default link: NonText
	TelescopeResultsComment = {}, -- Default link: Comment
	TelescopeResultsNumber = {}, -- Default link: Number
	TelescopeResultsIdentifier = {}, -- Default link: Identifier
	TelescopeResultsLineNr = {}, -- Default link: LineNr
	TelescopeResultsVariable = {}, -- Default link: SpecialChar
	TelescopeResultsStruct = {}, -- Default link: Struct
	TelescopeResultsOperator = {}, -- Default link: Operator
	TelescopeResultsDiffAdd = {}, -- Default link: DiffAdd
	TelescopeResultsMethod = {}, -- Default link: Method
	TelescopeResultsFunction = {}, -- Default link: Function
	TelescopeResultsField = {}, -- Default link: Function
	TelescopeResultsConstant = {}, -- Default link: Constant
	TelescopeResultsClass = {}, -- Default link: Function
	TelescopeResultsDiffChange = {}, -- Default link: DiffChange
	TelescopeResultsSpecialComment = {}, -- Default link: SpecialComment
	TelescopePreviewSticky = {}, -- Default link: Keyword
	TelescopePreviewHyphen = {}, -- Default link: NonText
	TelescopePreviewExecute = {}, -- Default link: String
	TelescopePreviewWrite = {}, -- Default link: Statement
	TelescopePreviewRead = {}, -- Default link: Constant
	TelescopePreviewSocket = {}, -- Default link: Statement
	TelescopePreviewLink = {}, -- Default link: Special
	TelescopePreviewBlock = {}, -- Default link: Constant
	TelescopePreviewDirectory = {}, -- Default link: Directory
	TelescopePreviewCharDev = {}, -- Default link: Constant
	TelescopePreviewPipe = {}, -- Default link: Constant
	TelescopePreviewMatch = {}, -- Default link: Search
	TelescopePreviewLine = {}, -- Default link: Visual
	TelescopeResultsDiffUntracked = {}, -- Default link: NonText
	TelescopeResultsDiffDelete = {}, -- Default link: DiffDelete
	TelescopePreviewSize = {}, -- Default link: String
	TelescopePreviewDate = {}, -- Default link: Directory
	TelescopePreviewGroup = {}, -- Default link: Constant
	TelescopePreviewUser = {}, -- Default link: Constant
}
M.mason = {
	MasonNormal = {}, -- Default link: NormalFloat
	MasonHeader = {},
	MasonHeaderSecondary = {},
	MasonHighlight = {},
		MasonLink = {},
	MasonHighlightBlock = {},
	MasonHighlightBlockBold = {},
	MasonHighlightSecondary = {},
	MasonHighlightBlockSecondary = {},
	MasonHighlightBlockBoldSecondary = {},
	MasonMuted = {},
	MasonMutedBlock = {},
	MasonMutedBlockBold = {},
	MasonError = {}, -- Default link: ErrorMsg
	MasonWarning = {}, -- Default link: WarningMsg
	MasonHeading = {},
}
M.lazy = {
	LazyButton = {}, -- Default link: CursorLine
	LazyButtonActive = {}, -- Default link: Visual
	LazyComment = {}, -- Default link: Comment
	LazyCommit = {}, -- Default link: @variable.builtin
	LazyCommitIssue = {}, -- Default link: Number
	LazyCommitScope = {}, -- Default link: Italic
	LazyCommitType = {}, -- Default link: Title
	LazyDimmed = {}, -- Default link: Conceal
	LazyDir = {}, -- Default link: @markup.link
	LazyH1 = {}, -- Default link: IncSearch
	LazyH2 = {}, -- Default link: Bold
	LazyLocal = {}, -- Default link: Constant
	LazyNoCond = {}, -- Default link: DiagnosticWarn
	LazyNormal = {}, -- Default link: NormalFloat
	LazyProgressDone = {}, -- Default link: Constant
	LazyProgressTodo = {}, -- Default link: LineNr
	LazyProp = {}, -- Default link: Conceal
	LazyReasonCmd = {}, -- Default link: Operator
	LazyReasonEvent = {}, -- Default link: Constant
	LazyReasonFt = {}, -- Default link: Character
	LazyReasonImport = {}, -- Default link: Identifier
	LazyReasonKeys = {}, -- Default link: Statement
	LazyReasonPlugin = {}, -- Default link: Special
	LazyReasonRequire = {}, -- Default link: @variable.parameter
	LazyReasonRuntime = {}, -- Default link: @macro
	LazyReasonSource = {}, -- Default link: Character
	LazyReasonStart = {}, -- Default link: @variable.member
	LazySpecial = {}, -- Default link: @punctuation.special
	LazyTaskError = {}, -- Default link: ErrorMsg
	LazyTaskOutput = {}, -- Default link: MsgArea
	LazyUrl = {}, -- Default link: @markup.link
	LazyValue = {}, -- Default link: @string
}
M.yankhighlight = {
	YankHighlight = {},
}
M.statusline = {
	StatuslineTextMain = {},
	StatuslineTextAccent = {},
	StatuslineModeNormal = {},
	StatuslineModeInsert = {},
	StatuslineModeVisual = {},
	StatuslineModeReplace = {},
	StatuslineModeCommand = {},
	StatuslineModeSelect = {},
	StatuslineFiletype = {},
	StatuslineSaved = {},
	StatuslineNotSaved = {},
	StatuslineReadOnly = {},
	StatuslineLspOn = {},
	StatuslineLspError = {},
	StatuslineLspWarning = {},
	StatuslineLspInfo = {},
	StatuslineLspHint = {},
	StatuslineHarpoon = {},
}
M.whichkey = {
	WhichKey = {}, -- Default link: Function
	WhichKeyGroup = {}, -- Default link: Keyword
	WhichKeySeparator = {}, -- Default link: DiffAdd
	WhichKeyDesc = {}, -- Default link: Identifier
	WhichKeyFloat = {}, -- Default link: NormalFloat
	WhichKeyBorder = {}, -- Default link: FloatBorder
	WhichKeyValue = {}, -- Default link: Comment
}

return M
