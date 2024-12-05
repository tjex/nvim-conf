return {

	"junegunn/vim-easy-align",

	init = function()
		local key = require("tjex.keybind")
		key.nmap({ "ga", ":EasyAlign<cr>" })
		key.vmap({ "ga", ":EasyAlign<cr>" })
	end,
}
