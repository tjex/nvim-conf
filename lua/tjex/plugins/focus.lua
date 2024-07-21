return {
	"nvim-focus/focus.nvim",
	version = "*",
	init = function()
		local key = require("tjex.keymap")
		require("focus").setup({})

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
}
