local key = require("tjex.keybind")
return {
	"nvim-focus/focus.nvim",
	version = "*",
	init = function()
		key.nmap({ "<leader>fb", "<cmd>FocusToggle<cr>" })
		key.nmap({
			"<leader>fc",
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
