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
        s(
        "countdown",
            fmt(
            [[
            countdown() {{
              local seconds=$1
              while [ $seconds -gt 0 ]; do
                printf "\rTime left: %02d:%02d" $((seconds / 60)) $((seconds % 60))
                sleep 1
                ((seconds--))
              done
              printf "\rTime left: 00:00\n"
              echo "Time's up!"
            }}
            ]],
            {}
        )
    ),
    -- s(
    --   "parse named args",
    --   fmt(
    --     [[
    --     while [[ "$#" -gt 0 ]]; do
    --       case $1 in
    --         --{}) {}="$2"; shift ;;
    --         *) echo "Unknown parameter: $1" ;;
    --       esac
    --       shift
    --     done
    --     ]],
    --     { i(1, "arg"), rep(1) }
    --   )
    -- )

}
