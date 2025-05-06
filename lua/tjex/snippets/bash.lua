-- bash snippets
local I = require("tjex.luasnip_vars")
local i = I.i
local s = I.s
local t = I.t
local fmt = I.fmt
local fmta = I.fmta

return {
	s(
		"yesno",
		t({
			"read -p 'Continue? (Y/N): ' confirm",

			"if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then",
			"   echo 'Continuing...'",
			"else",
			"   echo 'Aborted'",
			"fi",
		})
	),
	s(
		"for loop list",
		fmt(
			[[
            for item in "${{{}[@]}}"; do
                echo ${{item}}
            done

            ]],
			{ i(1) }
		)
	),
	s(
		"for loop file",
		fmt(
			[[
            while read item; do
                echo "$item"
            done <$file{}
            ]],
			{ i(1) }
		)
	),
	s(
		"for loop directory",
		fmt(
			[[
            for file in {}/*; do
                if [ -f "$file" ]; then  # Check if it is a file
                    echo "$(basename "$file")"  # Print the file name
                fi
            done
            ]],
			{ i(1) }
		)
	),
    s(
        "determine OS",
        t({
            'if [[ "$(uname -m)" == "Darwin" ]]; then',
            'elif [[ "$(uname)" == "Linux" ]]; then',
            'else',
            '    echo "Error, no rule for: " $(uname)',
            'fi',
        })
    ),
	s("script dir", t([[script_dir=$(dirname "$(realpath "$0")")]])),
}
