return {
	"nvim-focus/focus.nvim",
	version = "*",
	init = function()
		local key = require("tjex.keybind")

		key.nmap({ "<c-b>", "<cmd>FocusToggle<cr>" })
		key.nmap({
			"<c-ESC>",
			function()
				vim.cmd(":vnew")
				vim.cmd(":vnew")
				vim.cmd(":wincmd H")
				vim.cmd(":wincmd l")
				vim.cmd(":FocusToggle")
			end,
		})
	end,
	config = function()
		require("focus").setup({
			autoresize = { enable = false },
		})
	end,
}
