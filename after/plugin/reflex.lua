-- reflex color scheme by Tillman Jex (https://tjex.net)

local colorbuddy = require("colorbuddy")
colorbuddy.colorscheme("reflex")

-- don't color backgrounds of floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

Color.new("bground", "#121318")
Color.new("bg_lighter", "#1a1d22")
Color.new("bg_light", "#1b1e2d")
Color.new("bg_text", "#525d8a")
Color.new("white", "#eeeeee")

Color.new("primary", "#647f9d") -- blue_1
Color.new("secondary", "#7F718E") -- purple
Color.new("tertiary", "#bc9f76") -- burnt_yellow
Color.new("quart", "#bf8585") -- soft_red
Color.new("yellow", "#c4a06e")
Color.new("green", "#649d82") -- green
Color.new("blue_2", "#6f88a6")
Color.new("black", "#1a1a1a")
Color.new("gray_0", "#b4b4b4") -- brightest
Color.new("gray_1", "#bcbcbc")
Color.new("text", "#aeaeae") -- regular text
Color.new("gray_3", "#969696")
Color.new("gray_4", "#737373")
Color.new("gray_5", "#585858")
Color.new("gray_6", "#2b2b2b") -- dullest

-- diagnostic colors
Color.new("diag_error", "#945a4b")
Color.new("diag_info", "#aeaeae")
Color.new("diag_hint", "#649d82")
Color.new("diag_warn", "#b18d6d")

-- Group Sets
Group.new("border1", c.primary)
Group.new("border2", c.quart)
Group.new("hl_bg", c.black, c.primary)
Group.new("hl_fg", c.quart, nil)
Group.new("tab_unfocus", c.gray_4, c.bg_lighter)
Group.new("tab_focus", c.yellow, c.bg_lighter)

------------------
-- COLORING THINGS
------------------

-- notices
Group.new("DiagnosticError", c.diag_error)
Group.new("DiagnosticWarn", c.diag_warn)
Group.new("DiagnosticInfo", c.diag_info)
Group.new("DiagnosticHint", c.diag_hint)
Group.new("DiagnosticUnderlineError", nil, nil, s.underline)
Group.new("DiagnosticUnderlineWarn", nil, nil, s.underline)
Group.new("DiagnosticUnderlineInfo", nil, nil, s.underline)
Group.new("DiagnosticUnderlineHint", nil, nil, s.underline)
Group.new("Error", c.diag_error)
Group.new("WarningMsg", c.yellow, nil)
Group.new("ErrorMsg", c.diag_error, nil)

-- editor signage
Group.new("Conceal", c.gray_5)
Group.new("Cursor", nil) -- set by term
Group.new("ColorColumn", nil, nil)
Group.new("CursorLineNr", c.text, nil)
Group.new("CursorLine", nil, nil)
Group.new("Directory", c.gray_1)
Group.new("DiffAdded", c.green)
Group.new("DiffRemoved", c.quart)
Group.new("DiffFile", c.white, nil, s.underline)
Group.new("DiffOldFile", c.text)
Group.new("DiffNewFile", c.text)
Group.new("DiffAdd", c.primary)
Group.new("DiffChange", c.gray_0)
Group.new("DiffDelete", c.secondary)
Group.new("DiffText", c.gray_0)
Group.new("endofbuffer", c.bground)
Group.new("buffers", c.gray_4)
Group.new("SignColumn", nil, nil)
Group.new("LineNr", c.gray_4)
Group.new("statusline", c.bg_text, c.bg_lighter)
Group.new("statuslineNC", c.gray_4, nil, s.italic)
Group.new("WinSeparator", c.primary, nil)
Group.new("VertSplit", c.gray_6, c.gray_6)

-- UI Elements
Group.new("FloatBorder", g.border1)
Group.new("FoldColumn", g.border1)
Group.new("Folded", g.border2)
Group.new("MatchParen", nil, c.gray_5)
Group.new("MoreMsg", nil, c.gray_4)
Group.new("ModeMsg", c.diag_warn, nil)
Group.new("NonText", c.gray_6, nil)
Group.new("Pmenu", c.gray_0, c.bg_light)
Group.new("PmenuSel", g.hl_bg, g.hl_bg)
Group.new("PmenuSbar", c.primary, c.gray_6)
Group.new("PmenuThumb", c.primary, c.gray_5)
Group.new("Question", c.gray_0, c.gray_6)
Group.new("qffilename", c.text)
Group.new("QuickFixLine", c.white, nil)
Group.new("Search", g.hl_bg, g.hl_bg)
Group.new("IncSearch", g.hl_bg, g.hl_bg)
Group.new("CurSearch", g.hl_bg, g.hl_bg)
Group.new("SpecialKey", c.gray_4, nil)
Group.new("SpellBad", c.tertiary)
Group.new("SpellCap", c.tertiary)
Group.new("SpellLocal", c.gray_3)
Group.new("SpellRare", c.primary)
Group.new("TablineFill", nil, nil)
Group.new("Tabline", g.tab_unfocus, g.tab_unfocus)
Group.new("TabLineSel", g.tab_focus, g.tab_focus)
Group.new("Title", c.quart)
Group.new("WildMenu", c.yellow, c.bg_lighter)
Group.new("VisualNOS", c.primary, c.gray_6)
Group.new("Visual", g.hl_bg, g.hl_bg)

-- Syntax Highlighting
-- See :help treesitter-highlight-g
Group.new("@boolean", c.primary)
Group.new("boolean", c.primary)

Group.new("@character", c.secondary)
Group.new("character", c.secondary)

Group.new("@character.special", c.gray_0)
Group.new("character.special", c.gray_0)

Group.new("@comment", c.gray_5, nil, s.italic)
Group.new("comment", c.gray_5, nil, s.italic)

Group.new("@conditional", c.gray_0)
Group.new("conditional", c.gray_0)

Group.new("@constant", c.gray_4)
Group.new("constant", c.gray_4)

Group.new("@constant.builtin", c.gray_4)
Group.new("constant.builtin", c.gray_4)

Group.new("@constructor", c.gray_0)
Group.new("constructor", c.gray_0)

Group.new("@debug", c.gray_0)
Group.new("debug", c.gray_0)

Group.new("@define", c.gray_0)
Group.new("define", c.gray_0)

Group.new("@exception", c.gray_0)
Group.new("exception", c.gray_0)

Group.new("@field", c.gray_0)
Group.new("field", c.gray_0)

Group.new("@float", c.gray_0)
Group.new("float", c.gray_0)

Group.new("@function", c.quart)
Group.new("function", c.quart)

Group.new("@function.builtin", c.gray_0)
Group.new("function.builtin", c.gray_0)

Group.new("@function.call", c.gray_0)
Group.new("function.call", c.gray_0)

Group.new("@include", c.gray_4)
Group.new("include", c.gray_4)

Group.new("@keyword", c.gray_4)
Group.new("keyword", c.gray_4)

Group.new("@keyword.function", c.quart)
Group.new("keyword.function", c.quart)

Group.new("@keyword.operator", c.gray_4)
Group.new("keyword.operator", c.gray_4)

Group.new("@keyword.return", c.gray_0)
Group.new("keyword.return", c.gray_0)

Group.new("@label", c.gray_0)
Group.new("label", c.gray_0)

Group.new("@constant.macro", c.gray_5)
Group.new("constant.macro", c.gray_5)
Group.new("@function.macro", c.gray_5)
Group.new("function.macro", c.gray_5)
Group.new("@macro", c.gray_5)
Group.new("macro", c.gray_5)

Group.new("@markup.heading.1.markdown", c.quart, nil, s.underline)
Group.new("@markup.heading.2.markdown", c.quart, nil, s.underline)
Group.new("@markup.heading.3.markdown", c.quart, nil, s.underline)
Group.new("@markup.heading.4.markdown", c.quart, nil, s.underline)
Group.new("@markup.heading.5.markdown", c.quart, nil, s.underline)
Group.new("@markup.heading.6.markdown", c.quart, nil, s.underline)

Group.new("@method", c.quart)
Group.new("method", c.quart)

Group.new("@method.call", c.quart)
Group.new("method.call", c.quart)

Group.new("@namespace", c.gray_0)
Group.new("namespace", c.gray_0)

Group.new("@Normal", c.text, c.bground)
Group.new("Normal", c.text, c.bground)

Group.new("@none", c.gray_1)
Group.new("none", c.gray_1)

Group.new("@number", c.quart)
Group.new("number", c.quart)

Group.new("@operator", c.gray_4)
Group.new("operator", c.gray_4)

Group.new("@parameter", c.gray_0)
Group.new("parameter", c.gray_0)

Group.new("@preproc", c.quart)
Group.new("preproc", c.quart)

Group.new("@property", c.gray_0)
Group.new("property", c.gray_0)

Group.new("@punctuation", c.gray_0)
Group.new("punctuation", c.gray_0)

Group.new("@punctuation.bracket", c.gray_4)
Group.new("punctuation.bracket", c.gray_4)

Group.new("@punctuation.delimiter", c.gray_4)
Group.new("punctuation.delimiter", c.gray_4)

Group.new("@punctuation.special", c.quart)
Group.new("punctuation.special", c.quart)

Group.new("@repeat", c.gray_0)
Group.new("repeat", c.gray_0)

Group.new("@statement", c.gray_0)
Group.new("Statement", c.gray_0)

Group.new("@special", c.gray_3)
Group.new("Special", c.gray_3)

Group.new("@storageclass", c.gray_0)
Group.new("storageclass", c.gray_0)

Group.new("@string", c.primary)
Group.new("string", c.primary)

Group.new("@string.escape", c.gray_0)
Group.new("string.escape", c.gray_0)

Group.new("@string.special", c.gray_0)
Group.new("string.special", c.gray_0)

Group.new("@structure", c.gray_0)
Group.new("structure", c.gray_0)

Group.new("@tag", c.gray_4)
Group.new("tag", c.gray_4)

Group.new("@tag.attribute", c.text)
Group.new("tag.attribute", c.text)

Group.new("@tag.delimiter", c.gray_1)
Group.new("tag.delimiter", c.gray_1)

Group.new("@tag.delimiter.html", c.gray_1)

Group.new("@text.literal", c.secondary)
Group.new("text.literal", c.secondary)

Group.new("@text.reference", c.reference)
Group.new("text.reference", c.quart)

Group.new("@text.title", c.quart, nil, nil)
Group.new("text.title", c.quart)

Group.new("@text.todo", c.gray_0)
Group.new("text.todo", c.gray_0)

Group.new("@text.underline", c.gray_0)
Group.new("text.underline", c.gray_0)

Group.new("@text.uri", c.gray_0)
Group.new("text.uri", c.gray_0)

Group.new("@type", c.gray_0)
Group.new("type", c.gray_0)

Group.new("@identifier", c.gray_0)
Group.new("identifier", c.gray_0)

Group.new("@type.builtin", c.gray_4)
Group.new("type.builtin", c.gray_4)

Group.new("@type.definition", c.gray_0)
Group.new("type.definition", c.gray_0)

Group.new("@variable", c.gray_3)
Group.new("variable", c.gray_3)

Group.new("@variable.builtin", c.gray_3)
Group.new("variable.builtin", c.gray_3)

Group.new("@underlined", c.primary, nil, nil) -- markdown links also
Group.new("underlined", c.primary, nil, nil)

-------------
-- PLUGINS --
-------------

-- Oil

Group.new("OilDir", c.primary, nil)
Group.new("OilDirIcon", c.text, nil)

-- NvimTree
Group.new("NvimTreeOpenedFolderName", c.primary)
Group.new("NvimTreeFolderName", c.primary)
Group.new("NvimTreeEmptyFolderName", c.primary)
Group.new("NvimTreeImageFile", c.gray_4)
Group.new("NvimTreeCursorLine", c.white, nil, s.italic)
Group.new("NvimTreeNormal", nil)
Group.new("NvimTreeNormalFloat", nil)
Group.new("NvimTreeWinSeparator", g.border1)
Group.new("NvimTreeOpenedFile", c.gray_0, nil)
Group.new("NvimTreeExecFile", c.gray_0, nil)
Group.new("NvimTreeWindowPicker", g.tab_focus)
Group.new("NvimTreeRootFolder", c.quart, nil)
Group.new("NvimTreeEndOfBuffer", c.bground)
Group.new("NvimTreeIndentMarker", c.gray_5)
Group.new("NvimTreeSpecialFile", c.gray_0)

Group.new("NvimTreeGitNew", c.gray_4)
Group.new("NvimTreeGitDirty", c.gray_4)
Group.new("NvimTreeGitStaged", c.gray_4)
Group.new("NvimTreeGitMerge", c.gray_4)
Group.new("NvimTreeGitRenamed", c.gray_4)
Group.new("NvimTreeGitNew", c.gray_4)
Group.new("NvimTreeGitDeleted", c.gray_4)
Group.new("NvimTreeGitIgnored", c.gray_4)

-- fzf-lua
Group.new("FzfLuaFzfMatch", c.white)
Group.new("FzfLuaBorder", g.border1)
Group.new("FzfLuaFzfInfo", c.gray_3) -- e.g,  results counter
Group.new("FzfLuaHeaderText", c.quart)
Group.new("FzfLuaHeaderBind", c.text)
Group.new("FzfLuaBufferName", c.primary)
Group.new("FzfLuaLiveSym", c.quart)
Group.new("FzfLuaPathLineNr", c.gray_3)
Group.new("FzfLuaPathColNr", c.gray_3)
Group.new("FzfLuaBufNr", c.quart)
Group.new("FzfLuaTabTitle", c.primary)
Group.new("FzfLuaTabMarker", c.quart)
Group.new("FzfLuaCursorLineNr", g.hl_bg, g.hl_bg)

-- blankline
-- these hl g don't seem to work (2023-09-29)
Group.new("IblIndent", c.blue_1)

-- cmp
Group.new("CmpItemMenu", c.text)
Group.new("CmpItemAbbrMatch", c.text)
Group.new("CmpItemAbbr", c.gray_4)

-- Todo
Group.new("TodoSignNOTE", c.green, nil)
Group.new("TodoFgNOTE", c.green, nil)
