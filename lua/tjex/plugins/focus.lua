return {
	"nvim-focus/focus.nvim",
	version = "*",
	init = function()
		local key = require("tjex.keymap")

		key.nmap({ "<c-h>", "<cmd>FocusSplitLeft<cr>" })
		key.nmap({ "<c-j>", "<cmd>FocusSplitDown<cr>" })
		key.nmap({ "<c-k>", "<cmd>FocusSplitUp<cr>" })
		key.nmap({ "<c-l>", "<cmd>FocusSplitRight<cr>" })
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
