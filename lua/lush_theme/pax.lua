--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	-- shades
	local black = hsl(0, 0, 11)
	local greyDarkest = black.lighten(5)
	local greyDark = black.lighten(10)
	local grey = black.lighten(15)
	local greyLight = black.lighten(25)
	local greyLightest = black.lighten(50)

	-- colors
	-- errors and warnings
	local red = hsl(0, 100, 50)
	local orange = hsl(34, 100, 50)
	-- background and contrast
	local midnight = hsl(240, 11, 11)
	local cream = hsl(50, 20, 89)
	-- code and markup
	local wasabi = hsl(180, 20, 60)
	local lavender = hsl(300, 20, 60)
	local sky = hsl(210, 50, 70)
	local rose = hsl(0, 50, 70)
	local wheat = hsl(50, 40, 70)
	-- accent
	local hotPink = hsl(331, 100, 50)

	-- roles
	local error = red
	local warn = orange
	local dark = midnight
	local bright = cream

	-- utils
	local blank = { fg = bright }
	local hidden = { fg = dark, bg = dark }

	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		Normal({ fg = bright, bg = dark }), -- Normal text
		ColorColumn({ bg = greyDarkest }), -- Columns set with 'colorcolumn'
		Conceal(hidden), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ Normal }), -- Character under the cursor
		CurSearch({ bg = hotPink, fg = dark }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor({ Cursor }), -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM({ Cursor }), -- Like Cursor, but used when in IME mode |CursorIM|
		CursorLine({ bg = greyDarkest }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorColumn({ CursorLine }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		Directory({ fg = wasabi }), -- Directory names (and other special names in listings)
		DiffAdd(blank), -- Diff mode: Added line |diff.txt|
		DiffChange(blank), -- Diff mode: Changed line |diff.txt|
		DiffDelete(blank), -- Diff mode: Deleted line |diff.txt|
		DiffText(blank), -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer(hidden), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor({ bg = hotPink }), -- Cursor in a focused terminal
		TermCursorNC({ Normal, gui = "reverse" }), -- Cursor in an unfocused terminal
		ErrorMsg({ fg = error }), -- Error messages on the command line
		VertSplit({ Normal }), -- Column separating vertically split windows
		Folded({ Normal }), -- Line used for closed folds
		FoldColumn({ Normal }), -- 'foldcolumn'
		SignColumn({ Normal }), -- Column where |signs| are displayed
		IncSearch({ bg = bright, fg = dark }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute({ CurSearch }), -- |:substitute| replacement text highlighting
		LineNr({ SignColumn, fg = greyLight }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove(blank), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow(blank), -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr({ CursorLine, fg = hotPink }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold({ CursorLineNr }), -- Like FoldColumn when 'cursorline' is set for the cursor line
		CursorLineSign({ CursorLineNr }), -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen({ fg = hotPink }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg({ Normal }), -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({ Normal }), -- Area for messages and cmdline
		MsgSeparator({ Normal }), -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ Normal }), -- |more-prompt|
		NonText({ Normal }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		NormalFloat({ fg = bright, bg = greyDark }), -- Normal text in floating windows.
		FloatBorder({ Normal }), -- Border of floating windows.
		FloatTitle({ Normal }), -- Title of floating windows.
		NormalNC({ Normal }), -- normal text in non-current windows
		Pmenu({ NormalFloat }), -- Popup menu: Normal item.
		PmenuSel({ bg = hotPink, fg = dark }), -- Popup menu: Selected item.
		PmenuKind({ Pmenu }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ PmenuSel }), -- Popup menu: Selected item "kind"
		PmenuExtra({ Pmenu }), -- Popup menu: Normal item "extra text"
		PmenuExtraSel({ PmenuSel }), -- Popup menu: Selected item "extra text"
		PmenuSbar({ bg = grey }), -- Popup menu: Scrollbar.
		PmenuThumb({ bg = greyDarkest }), -- Popup menu: Thumb of the scrollbar.
		Question({ Normal }), -- |hit-enter| prompt and yes/no questions
		QuickFixLine({ PmenuSel }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ IncSearch }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey({ Normal }), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad({ Normal }), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap({ Normal })(), -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal({ Normal }), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare({ Normal }), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine({ Normal }), -- Status line of current window
		StatusLineNC(hidden), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine({ Normal }), -- Tab pages line, not active tab page label
		TabLineFill({ Normal }), -- Tab pages line, where there are no labels
		TabLineSel({ Normal }), -- Tab pages line, active tab page label
		Title({ Normal }), -- Titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = grey, fg = hotPink }), -- Visual mode selection
		VisualNOS({ Visual }), -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = warn }), -- Warning messages
		Whitespace({ Normal }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator({ Normal }), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu({ PmenuSel }), -- Current match in 'wildmenu' completion
		WinBar({ SignColumn, fg = hotPink }), -- Window bar of current window
		WinBarNC({ LineNr }), -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment({ fg = greyLightest }), -- Any comment

		Constant({ fg = rose }), -- (*) Any constant
		-- String { }, --   A string constant: "this is a string"
		-- Character { }, --   A character constant: 'c', '\n'
		-- Number { }, --   A number constant: 234, 0xff
		-- Boolean        { }, --   A boolean constant: TRUE, false
		-- Float { }, --   A floating point constant: 2.3e10

		Identifier({ fg = wasabi }), -- (*) Any variable name
		Function({ fg = wheat }), --   Function name (also: methods for classes)

		Statement({ fg = lavender }), -- (*) Any statement
		-- Conditional    { }, --   if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --   case, default, etc.
		-- Operator       { }, --   "sizeof", "+", "*", etc.
		-- Keyword        { }, --   any other keyword
		-- Exception      { }, --   try, catch, throw

		PreProc({ fg = lavender }), -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = sky }), -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		-- Structure      { }, --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special({ Normal }), -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		-- Tag            { }, --   You can use CTRL-] on this
		Delimiter({ fg = bright }), --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		Underlined({ Normal, gui = "underline" }), -- Text that stands out, HTML links
		Ignore({ Normal }), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ Normal }), -- Any erroneous construct
		Todo({ Normal }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		LspReferenceText({ Normal }), -- Used for highlighting "text" references
		LspReferenceRead({ Normal }), -- Used for highlighting "read" references
		LspReferenceWrite({ Normal }), -- Used for highlighting "write" references
		LspCodeLens({ Normal }), -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		LspCodeLensSeparator({ Normal }), -- Used to color the seperator between two or more code lens.
		LspSignatureActiveParameter({ PmenuSel }), -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = error }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = warn }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ Comment }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ Comment }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = sky }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError(), -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn(), -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo(), -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint(), -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk(), -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError(), -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn(), -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo(), -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint(), -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk(), -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag

		-- Treesitter Language specific - nb although these look the same,
		-- combining them causes funny highlighting in TSX delimiters.
		-- JS(X)
		sym("@constant.builtin.javascript")({ Constant }), -- null/undefined
		sym("@constructor.javascript")({ Function }), -- treat constructor as a method
		sym("@tag.builtin.javascript")({ Type }), -- div/a/span etc.
		sym("@tag.javascript")({ Type }), -- custom components
		sym("@none.javascript")({ Constant }), -- text inside tags

		-- TS(X)
		sym("@constant.builtin.tsx")({ Constant }), -- null/undefined
		sym("@constructor.tsx")({ Function }), -- treat constructor as a method
		sym("@tag.builtin.tsx")({ Type }), -- div/a/span etc.
		sym("@tag.tsx")({ Type }), -- custom components
		sym("@none.tsx")({ Constant }), -- text inside tags
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
