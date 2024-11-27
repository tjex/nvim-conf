-- bash snippets
local I = require("tjex.luasnip_vars")
local i = I.i
local s = I.s
local t = I.t
local fmt = I.fmt

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
            for read item; do
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
	s("script dir", t([[script_dir=$(dirname "$(realpath "$0")")]])),
    -- don't know how to escape the brackets, and cbf looking it up now
    -- s("pause", fmt(
    --     [[
    --     func pause() {
    --         read 'response?To continue, type "c": '
    --         if [[ $response == "c" ]]; then
    --             echo 'Continuing ...'
    --         else
    --             pause
    --         fi
    --     }
    --
    --     pause
    --     {{}}
    --     ]],
    --         { i(1)}
    -- )),
}
