return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {
		warn_no_results = true,
		open_no_results = false,
	},

	init = function()
		local key = require("tjex.keybind")

		key.nmap({
			"<leader>ig",
			"<cmd>Trouble diagnostics toggle<cr>",
		})
	end,
}
