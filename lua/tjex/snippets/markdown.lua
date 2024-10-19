-- markdown snippets
local I = require("tjex.luasnip_vars")
local i = I.i
local s = I.s
local t = I.t
local fmt = I.fmt

return {
	s(
		"pandoc",
		t({
			"---",
			"documentclass: scrartcl",
			"title: Title",
			"subtitle: Subtitle",
			"author: Author",
			"date: date",
			"geometry: margin=2.5cm",
			"linestretch: 1.2",
			"fontfamily: inter",
			"fontfamilyoptions: sfdefault",
			"---",
		})
	),
}
