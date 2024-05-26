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
-- NEW ADDED??????
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
	LspSignatureActiveParameter = {},
	SnippetTabStop = {},
	diffAdded = {},
	diffRemoved = {},
	diffChanged = {},
	diffText = {},
}
M.diagnostic = {
	DiagnosticError = {},
		DiagnosticVirtualTextError = { link = 'DiagnosticError' },
		DiagnosticFloatingError = { link = 'DiagnosticError' },
		DiagnosticSignError = { link = 'DiagnosticError' },
	DiagnosticWarn = {},
		DiagnosticVirtualTextWarn = { link = 'DiagnosticWarn' },
		DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
		DiagnosticSignWarn = { link = 'DiagnosticWarn' },
	DiagnosticInfo = {},
		DiagnosticVirtualTextInfo = { link = 'DiagnosticInfo' },
		DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
		DiagnosticSignInfo = { link = 'DiagnosticInfo' },
	DiagnosticHint = {},
		DiagnosticVirtualTextHint = { link = 'DiagnosticHint' },
		DiagnosticFloatingHint = { link = 'DiagnosticHint' },
		DiagnosticSignHint = { link = 'DiagnosticHint' },
	DiagnosticOk = {},
		DiagnosticVirtualTextOk = { link = 'DiagnosticOk' },
		DiagnosticFloatingOk = { link = 'DiagnosticOk' },
		DiagnosticSignOk = { link = 'DiagnosticOk' },
	DiagnosticUnderlineError = {},
	DiagnosticUnderlineWarn = {},
	DiagnosticUnderlineInfo = {},
	DiagnosticUnderlineHint = {},
	DiagnosticUnderlineOk = {},
	DiagnosticDeprecated = {},
	DiagnosticUnnecessary = {}, -- Default Link: Comment
}
M.treesitter = {
-- IDENTIFIERS
	['@variable'] = {}, -- Default Link: Identifier
		['@variable.builtin'] = { link = '@variable' },
		['@variable.parameter'] = { link = '@variable' },
			['@variable.parameter.builtin'] = { link = '@variable.parameter' },
		['@variable.member'] = { link = '@variable' },
	['@constant'] = {}, -- Default Link: Constant
		['@constant.builtin'] = { link = '@constant' }, -- Default Link: Special
		['@constant.macro'] = { link = '@constant' }, -- Default Link: Define
	['@module'] = {},
		['@module.builtin'] = { link = '@module' },
	['@label'] = {}, -- Default Link: Label
-- LITERALS
	['@string'] = {}, -- Default Link: Constant
		['@string.documentation'] = { link = '@string' },
		['@string.regexp'] = { link = '@string' },
		['@string.escape'] = { link = '@string' }, -- Default Link: SpecialChar
		['@string.special'] = { link = '@string' }, -- Default Link: SpecialChar
			['@string.special.symbol'] = { link = '@string.special' },
			['@string.special.url'] = { link = '@string.special' },
			['@string.special.path'] = { link = '@string.special' },
	['@character'] = {}, -- Default Link: Character
		['@character.special'] = { link = '@character' }, -- Default Link: SpecialChar
	['@boolean'] = {}, -- Default Link: Boolean
	['@number'] = {}, -- Default Link: Number
		['@number.float'] = { link = '@number' },
-- TYPES
	['@type'] = {}, -- Default Link: Type
		['@type.builtin'] = { link = '@type' },
		['@type.definition'] = { link = '@type' }, -- Default Link: Typedef
	['@attribute'] = {},
		['@attribute.builtin'] = { link = '@attribute' },
	['@property'] = {}, -- Default Link: Identifier
-- FUNCTIONS
	['@function'] = {}, -- Default Link: Function
		['@function.builtin'] = { link = '@function' }, -- Default Link: Special
		['@function.call'] = { link = '@function' },
		['@function.macro'] = { link = '@function' }, -- Default Link: Macro
		['@function.method'] = { link = '@function' },
			['@function.method.call'] = { link = '@function.method' },
	['@constructor'] = {}, -- Default Link: Special
	['@operator'] = {}, -- Default Link: Operator
-- KEYWORDS
	['@keyword'] = {}, -- Default Link: Keyword
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
	['@punctuation'] = {}, -- Default Link: Delimiter
		['@punctuation.delimiter'] = { link = '@punctuation' },
		['@punctuation.bracket'] = { link = '@punctuation' },
		['@punctuation.special'] = { link = '@punctuation' },
-- COMMENTS
	['@comment'] = {}, -- Default Link: Comment
		['@comment.documentation'] = { link = '@comment' },
		['@comment.error'] = { link = '@comment' },
		['@comment.warning'] = { link = '@comment' },
		['@comment.todo'] = { link = '@comment' },
		['@comment.note'] = { link = '@comment' },
-- MARKUP
	['@markup'] = {},
		['@markup.strong'] = { link = '@markup' },
		['@markup.italic'] = { link = '@markup' },
		['@markup.strikethrough'] = { link = '@markup' },
		['@markup.underline'] = { link = '@markup' },
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
	['@diff'] = {},
		['@diff.plus'] = { link = '@diff' },
		['@diff.minus'] = { link = '@diff' },
		['@diff.delta'] = { link = '@diff' },
-- TAG
	['@tag'] = {}, -- Default Link: Tag
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
M.lsp = { -- NOT DONE
	['@lsp'] = {},
	['@lsp.type.class'] = { link = '@lsp.type' }, -- Default Link: Structure
	['@lsp.type.comment'] = { link = '@lsp.type' }, -- Default Link: Comment
	['@lsp.type.decorator'] = { link = '@lsp.type' }, -- Default Link: Function
	['@lsp.type.enum'] = { link = '@lsp.type' }, -- Default Link: Structure
	['@lsp.type.enumMember'] = { link = '@lsp.type' }, -- Default Link: Constant
	['@lsp.type.function'] = { link = '@lsp.type' }, -- Default Link: Function
	['@lsp.type.interface'] = { link = '@lsp.type' }, -- Default Link: Structure
	['@lsp.type.macro'] = { link = '@lsp.type' }, -- Default Link: Macro
	['@lsp.type.method'] = { link = '@lsp.type' }, -- Default Link: Function
	['@lsp.type.namespace'] = { link = '@lsp.type' }, -- Default Link: Structure
	['@lsp.type.parameter'] = { link = '@lsp.type' }, -- Default Link: Identifier
	['@lsp.type.property'] = { link = '@lsp.type' }, -- Default Link: Identifier
	['@lsp.type.struct'] = { link = '@lsp.type' }, -- Default Link: Structure
	['@lsp.type.type'] = { link = '@lsp.type' }, -- Default Link: Type
	['@lsp.type.typeParameter'] = { link = '@lsp.type' }, -- Default Link: Typedef
	['@lsp.type.variable'] = { link = '@lsp.type' }, -- Default Link: Identifier
}
M.nvim = {
	NvimInternalError = {},
		NvimFigureBrace = { link = 'NvimInternalError' },
		NvimSingleQuotedUnknownEscape = { link = 'NvimInternalError' },
		NvimInvalidSingleQuotedUnknownEscape = { link = 'NvimInternalError' },
	NvimAssignment = {}, -- Default Link: Operator
		NvimPlainAssignment = { link = 'NvimAssignment' },
		NvimAugmentedAssignment = { link = 'NvimAssignment' },
			NvimAssignmentWithAddition = { link = 'NvimAugmentedAssignment' },
			NvimAssignmentWithSubtraction = { link = 'NvimAugmentedAssignment' },
			NvimAssignmentWithConcatenation = { link = 'NvimAugmentedAssignment' },
	NvimOperator = {}, -- Default Link: Operator
		NvimUnaryOperator = { link = 'NvimOperator' },
			NvimUnaryPlus = { link = 'NvimUnaryOperator' },
			NvimUnaryMinus = { link = 'NvimUnaryOperator' },
			NvimNot = { link = 'NvimUnaryOperator' },
		NvimBinaryOperator = { link = 'NvimOperator' },
			NvimComparison = { link = 'NvimBinaryOperator' },
				NvimComparisonModifier = { link = 'NvimComparison' },
			NvimBinaryPlus = { link = 'NvimBinaryOperator' },
			NvimBinaryMinus = { link = 'NvimBinaryOperator' },
			NvimConcat = { link = 'NvimBinaryOperator' },
				NvimConcatOrSubscript = { link = 'NvimConcat' },
			NvimOr = { link = 'NvimBinaryOperator' },
			NvimAnd = { link = 'NvimBinaryOperator' },
			NvimMultiplication = { link = 'NvimBinaryOperator' },
			NvimDivision = { link = 'NvimBinaryOperator' },
			NvimMod = { link = 'NvimBinaryOperator' },
		NvimTernary = { link = 'NvimOperator' },
			NvimTernaryColon = { link = 'NvimTernary' },
	NvimParenthesis = {}, -- Default Link: Delimiter
		NvimLambda = { link = 'NvimParenthesis' },
		NvimNestingParenthesis = { link = 'NvimParenthesis' },
		NvimCallingParenthesis = { link = 'NvimParenthesis' },
		NvimSubscript = { link = 'NvimParenthesis' },
			NvimSubscriptBracket = { link = 'NvimSubscript' },
			NvimSubscriptColon = { link = 'NvimSubscript' },
			NvimCurly = { link = 'NvimSubscript' },
		NvimContainer = { link = 'NvimParenthesis' },
			NvimDict = { link = 'NvimContainer' },
			NvimList = { link = 'NvimContainer' },
	NvimIdentifier = {}, -- Default Link: Identifier
		NvimIdentifierScope = { link = 'NvimIdentifier' },
			NvimOptionScope = { link = 'NvimIdentifierScope' },
		NvimIdentifierScopeDelimiter = { link = 'NvimIdentifier' },
			NvimOptionScopeDelimiter = { link = 'NvimIdentifierScopeDelimiter' },
		NvimIdentifierName = { link = 'NvimIdentifier' },
		NvimIdentifierKey = { link = 'NvimIdentifier' },
		NvimOptionName = { link = 'NvimIdentifier' },
		NvimEnvironmentName = { link = 'NvimIdentifier' },
	NvimColon = {}, -- Default Link: Delimiter
	NvimComma = {}, -- Default Link: Delimiter
	NvimArrow = {}, -- Default Link: Delimiter
	NvimRegister = {}, -- Default Link: SpecialChar
	NvimNumber = {}, -- Default Link: Number
		NvimFloat = { link = 'NvimNumber' },
	NvimNumberPrefix = {}, -- Default Link: Type
	NvimOptionSigil = {}, -- Default Link: Type
		NvimEnvironmentSigil = { link = 'NvimOptionSigil' },
	NvimString = {}, -- Default Link: String
		NvimStringBody = { link = 'NvimString' },
			NvimSingleQuotedBody = { link = 'NvimStringBody' },
			NvimDoubleQuotedBody = { link = 'NvimStringBody' },
			NvimInvalidStringBody = { link = 'NvimStringBody' },
				NvimInvalidSingleQuotedBody = { link = 'NvimInvalidStringBody' },
				NvimInvalidDoubleQuotedBody = { link = 'NvimInvalidStringBody' },
		NvimStringQuote = { link = 'NvimString' },
			NvimSingleQuote = { link = 'NvimStringQuote' },
			NvimDoubleQuote = { link = 'NvimStringQuote' },
	NvimStringSpecial = {}, -- Default Link: SpecialChar
		NvimSingleQuotedQuote = { link = 'NvimStringSpecial' },
		NvimDoubleQuotedEscape = { link = 'NvimStringSpecial' },
		NvimInvalidStringSpecial = { link = 'NvimStringSpecial' },
			NvimInvalidSingleQuotedQuote = { link = 'NvimInvalidStringSpecial' },
			NvimInvalidDoubleQuotedEscape = { link = 'NvimInvalidStringSpecial' },
	NvimSpacing = {}, -- Default Link: Normal
	NvimInvalid = {}, -- Default Link: Error
		NvimInvalidAssignment = { link = 'NvimInvalid' },
			NvimInvalidPlainAssignment = { link = 'NvimInvalidAssignment' },
			NvimInvalidAugmentedAssignment = { link = 'NvimInvalidAssignment' },
				NvimInvalidAssignmentWithAddition = { link = 'NvimInvalidAugmentedAssignment' },
				NvimInvalidAssignmentWithSubtraction = { link = 'NvimInvalidAugmentedAssignment' },
				NvimInvalidAssignmentWithConcatenation = { link = 'NvimInvalidAugmentedAssignment' },
		NvimInvalidOperator = { link = 'NvimInvalid' },
			NvimInvalidUnaryOperator = { link = 'NvimInvalidOperator' },
				NvimInvalidUnaryPlus = { link = 'NvimInvalidUnaryOperator' },
				NvimInvalidUnaryMinus = { link = 'NvimInvalidUnaryOperator' },
				NvimInvalidNot = { link = 'NvimInvalidUnaryOperator' },
			NvimInvalidBinaryOperator = { link = 'NvimInvalidOperator' },
				NvimInvalidComparison = { link = 'NvimInvalidBinaryOperator' },
					NvimInvalidComparisonModifier = { link = 'NvimInvalidComparison' },
				NvimInvalidBinaryPlus = { link = 'NvimInvalidBinaryOperator' },
				NvimInvalidBinaryMinus = { link = 'NvimInvalidBinaryOperator' },
				NvimInvalidConcat = { link = 'NvimInvalidBinaryOperator' },
					NvimInvalidConcatOrSubscript = { link = 'NvimInvalidConcat' },
				NvimInvalidOr = { link = 'NvimInvalidBinaryOperator' },
				NvimInvalidAnd = { link = 'NvimInvalidBinaryOperator' },
				NvimInvalidMultiplication = { link = 'NvimInvalidBinaryOperator' },
				NvimInvalidDivision = { link = 'NvimInvalidBinaryOperator' },
				NvimInvalidMod = { link = 'NvimInvalidBinaryOperator' },
			NvimInvalidTernary = { link = 'NvimInvalidOperator' },
				NvimInvalidTernaryColon = { link = 'NvimInvalidTernary' },
		NvimInvalidDelimiter = { link = 'NvimInvalid' },
			NvimInvalidParenthesis = { link = 'NvimInvalidDelimiter' },
				NvimInvalidLambda = { link = 'NvimInvalidParenthesis' },
				NvimInvalidNestingParenthesis = { link = 'NvimInvalidParenthesis' },
				NvimInvalidCallingParenthesis = { link = 'NvimInvalidParenthesis' },
				NvimInvalidSubscript = { link = 'NvimInvalidParenthesis' },
					NvimInvalidSubscriptBracket = { link = 'NvimInvalidSubscript' },
					NvimInvalidSubscriptColon = { link = 'NvimInvalidSubscript' },
					NvimInvalidCurly = { link = 'NvimInvalidSubscript' },
				NvimInvalidContainer = { link = 'NvimInvalidParenthesis' },
					NvimInvalidDict = { link = 'NvimInvalidContainer' },
					NvimInvalidList = { link = 'NvimInvalidContainer' },
			NvimInvalidColon = { link = 'NvimInvalidDelimiter' },
			NvimInvalidComma = { link = 'NvimInvalidDelimiter' },
			NvimInvalidArrow = { link = 'NvimInvalidDelimiter' },
			NvimInvalidFigureBrace = { link = 'NvimInvalidDelimiter' },
		NvimInvalidValue = { link = 'NvimInvalid' },
			NvimInvalidIdentifier = { link = 'NvimInvalidValue' },
				NvimInvalidIdentifierScope = { link = 'NvimInvalidIdentifier' },
					NvimInvalidOptionScope = { link = 'NvimInvalidIdentifierScope' },
				NvimInvalidIdentifierScopeDelimiter = { link = 'NvimInvalidIdentifier' },
					NvimInvalidOptionScopeDelimiter = { link = 'NvimInvalidIdentifierScopeDelimiter' },
				NvimInvalidIdentifierName = { link = 'NvimInvalidIdentifier' },
				NvimInvalidIdentifierKey = { link = 'NvimInvalidIdentifier' },
				NvimInvalidOptionSigil = { link = 'NvimInvalidIdentifier' },
					NvimInvalidEnvironmentSigil = { link = 'NvimInvalidOptionSigil' },
				NvimInvalidOptionName = { link = 'NvimInvalidIdentifier' },
				NvimInvalidEnvironmentName = { link = 'NvimInvalidIdentifier' },
			NvimInvalidRegister = { link = 'NvimInvalidValue' },
			NvimInvalidNumber = { link = 'NvimInvalidValue' },
				NvimInvalidFloat = { link = 'NvimInvalidNumber' },
				NvimInvalidNumberPrefix = { link = 'NvimInvalidNumber' },
			NvimInvalidString = { link = 'NvimInvalidValue' },
				NvimInvalidStringQuote = { link = 'NvimInvalidString' },
					NvimInvalidSingleQuote = { link = 'NvimInvalidStringQuote' },
					NvimInvalidDoubleQuote = { link = 'NvimInvalidStringQuote' },
			NvimDoubleQuotedUnknownEscape = { link = 'NvimInvalidValue' },
			NvimInvalidDoubleQuotedUnknownEscape = { link = 'NvimInvalidValue' },
	NvimInvalidSpacing = {}, -- Default Link: ErrorMsg
}
M.nvimcmp = { -- NOT DONE -- LINKS TO PMENU SOMEWHERE
	CmpItemAbbrDefault = {}, -- MUST BE LINKING SOMEWHERE
		CmpItemAbbr = { link = 'CmpItemAbbrDefault' },
	CmpItemAbbrDeprecatedDefault = {}, -- MUST BE LINKING SOMEWHERE
		CmpItemAbbrDeprecated = { link = 'CmpItemAbbrDeprecatedDefault' },
	CmpItemAbbrMatchDefault = {}, -- MUST BE LINKING SOMEWHERE
		CmpItemAbbrMatch = { link = 'CmpItemAbbrMatchDefault' },
	CmpItemMenuDefault = {}, -- MUST LINK SOMEWHERE
	CmpItemAbbrMatchFuzzyDefault = {}, -- MUST LINK SOMEWHERE
		CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatchFuzzyDefault' },
	CmpItemKindDefault = {}, -- MUST BE LINKING SOMEWHERE
		CmpItemMenu = { link = 'CmpItemKindDefault' },
		CmpItemKind = { link = 'CmpItemKindDefault' },
			CmpItemKindClassDefault = { link = 'CmpItemKind' },
				CmpItemKindClass = { link = 'CmpItemKindClassDefault' },
			CmpItemKindVariableDefault = { link = 'CmpItemKind' },
				CmpItemKindVariable = { link = 'CmpItemKindVariableDefault' },
			CmpItemKindPropertyDefault = { link = 'CmpItemKind' },
				CmpItemKindProperty = { link = 'CmpItemKindPropertyDefault' },
			CmpItemKindFieldDefault = { link = 'CmpItemKind' },
				CmpItemKindField = { link = 'CmpItemKindFieldDefault' },
			CmpItemKindTextDefault = { link = 'CmpItemKind' },
				CmpItemKindText = { link = 'CmpItemKindTextDefault' },
			CmpItemKindMethodDefault = { link = 'CmpItemKind' },
				CmpItemKindMethod = { link = 'CmpItemKindMethodDefault' },
			CmpItemKindFunctionDefault = { link = 'CmpItemKind' },
				CmpItemKindFunction = { link = 'CmpItemKindFunctionDefault' },
			CmpItemKindFolderDefault = { link = 'CmpItemKind' },
				CmpItemKindFolder = { link = 'CmpItemKindFolderDefault' },
			CmpItemKindReferenceDefault = { link = 'CmpItemKind' },
				CmpItemKindReference = { link = 'CmpItemKindReferenceDefault' },
			CmpItemKindConstantDefault = { link = 'CmpItemKind' },
				CmpItemKindConstant = { link = 'CmpItemKindConstantDefault' },
			CmpItemKindUnitDefault = { link = 'CmpItemKind' },
				CmpItemKindUnit = { link = 'CmpItemKindUnitDefault' },
			CmpItemKindValueDefault = { link = 'CmpItemKind' },
				CmpItemKindValue = { link = 'CmpItemKindValueDefault' },
			CmpItemKindColorDefault = { link = 'CmpItemKind' },
				CmpItemKindColor = { link = 'CmpItemKindColorDefault' },
			CmpItemKindSnippetDefault = { link = 'CmpItemKind' },
				CmpItemKindSnippet = { link = 'CmpItemKindSnippetDefault' },
			CmpItemKindStructDefault = { link = 'CmpItemKind' },
				CmpItemKindStruct = { link = 'CmpItemKindStructDefault' },
			CmpItemKindInterfaceDefault = { link = 'CmpItemKind' },
				CmpItemKindInterface = { link = 'CmpItemKindInterfaceDefault' },
			CmpItemKindConstructorDefault = { link = 'CmpItemKind' },
				CmpItemKindConstructor = { link = 'CmpItemKindConstructorDefault' },
			CmpItemKindKeywordDefault = { link = 'CmpItemKind' },
				CmpItemKindKeyword = { link = 'CmpItemKindKeywordDefault' },
			CmpItemKindTypeParameterDefault = { link = 'CmpItemKind' },
				CmpItemKindTypeParameter = { link = 'CmpItemKindTypeParameterDefault' },
			CmpItemKindEventDefault = { link = 'CmpItemKind' },
				CmpItemKindEvent = { link = 'CmpItemKindEventDefault' },
			CmpItemKindOperatorDefault = { link = 'CmpItemKind' },
				CmpItemKindOperator = { link = 'CmpItemKindOperatorDefault' },
			CmpItemKindFileDefault = { link = 'CmpItemKind' },
				CmpItemKindFile = { link = 'CmpItemKindFileDefault' },
			CmpItemKindEnumMemberDefault = { link = 'CmpItemKind' },
				CmpItemKindEnumMember = { link = 'CmpItemKindEnumMemberDefault' },
			CmpItemKindEnumDefault = { link = 'CmpItemKind' },
				CmpItemKindEnum = { link = 'CmpItemKindEnumDefault' },
			CmpItemKindModuleDefault = { link = 'CmpItemKind' },
				CmpItemKindModule = { link = 'CmpItemKindModuleDefault' },
}
M.telescope = {
	TelescopeNormal = {}, -- Default Link: Normal
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
	TelescopeSelection = {}, -- Default Link: Visual
		TelescopeSelectionCaret = { link = 'TelescopeSelection' },
	TelescopeMultiIcon = {}, -- Default Link: Identifier
	TelescopeMultiSelection = {}, -- Default Link: Type
	TelescopeMatching = {}, -- Default Link: Special
	TelescopePromptPrefix = {}, -- Default Link: Identifier
	TelescopePromptCounter = {}, -- Default Link: NonText
	TelescopeResultsComment = {}, -- Default Link: Comment
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
	TelescopeResultsDiffUntracked = {}, -- Default Link: NonText
	TelescopeResultsDiffDelete = {}, -- Default Link: DiffDelete
	TelescopePreviewSize = {}, -- Default Link: String
	TelescopePreviewDate = {}, -- Default Link: Directory
	TelescopePreviewGroup = {}, -- Default Link: Constant
	TelescopePreviewUser = {}, -- Default Link: Constant
}
M.mason = {
	MasonNormal = {}, -- Default Link: NormalFloat
	MasonHeader = {},
	MasonHeaderSecondary = {},
	MasonHighlight = {},
		MasonLink = { link = 'MasonHighlight' },
	MasonHighlightBlock = {},
	MasonHighlightBlockBold = {},
	MasonHighlightSecondary = {},
	MasonHighlightBlockSecondary = {},
	MasonHighlightBlockBoldSecondary = {},
	MasonMuted = {},
	MasonMutedBlock = {},
	MasonMutedBlockBold = {},
	MasonError = {}, -- Default Link: ErrorMsg
	MasonWarning = {}, -- Default Link: WarningMsg
	MasonHeading = {},
}
M.lazy = {
	LazyButton = {}, -- Default Link: CursorLine
	LazyButtonActive = {}, -- Default Link: Visual
	LazyComment = {}, -- Default Link: Comment
	LazyCommit = {}, -- Default Link: @variable.builtin
	LazyCommitIssue = {}, -- Default Link: Number
	LazyCommitScope = {}, -- Default Link: Italic
	LazyCommitType = {}, -- Default Link: Title
	LazyDimmed = {}, -- Default Link: Conceal
	LazyDir = {}, -- Default Link: @markup.link
	LazyH1 = {}, -- Default Link: IncSearch
	LazyH2 = {}, -- Default Link: Bold
	LazyLocal = {}, -- Default Link: Constant
	LazyNoCond = {}, -- Default Link: DiagnosticWarn
	LazyNormal = {}, -- Default Link: NormalFloat
	LazyProgressDone = {}, -- Default Link: Constant
	LazyProgressTodo = {}, -- Default Link: LineNr
	LazyProp = {}, -- Default Link: Conceal
	LazyReasonCmd = {}, -- Default Link: Operator
	LazyReasonEvent = {}, -- Default Link: Constant
	LazyReasonFt = {}, -- Default Link: Character
	LazyReasonImport = {}, -- Default Link: Identifier
	LazyReasonKeys = {}, -- Default Link: Statement
	LazyReasonPlugin = {}, -- Default Link: Special
	LazyReasonRequire = {}, -- Default Link: @variable.parameter
	LazyReasonRuntime = {}, -- Default Link: @macro
	LazyReasonSource = {}, -- Default Link: Character
	LazyReasonStart = {}, -- Default Link: @variable.member
	LazySpecial = {}, -- Default Link: @punctuation.special
	LazyTaskError = {}, -- Default Link: ErrorMsg
	LazyTaskOutput = {}, -- Default Link: MsgArea
	LazyUrl = {}, -- Default Link: @markup.link
	LazyValue = {}, -- Default Link: @string
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

return M
