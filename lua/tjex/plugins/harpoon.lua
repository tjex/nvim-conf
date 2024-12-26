return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = { "nvim-lua/plenary.nvim" },

	config = function()
		local key = require("tjex.keybind")
		local h = require("harpoon")

		require("harpoon").setup({
			-- menu = {
			-- 	width = vim.api.nvim_win_get_width(0) - 200,
			-- },
		})

		key.nmap({
			"<leader>a",
			function()
				h:list():add()
			end,
		})
		key.nmap({
			"<leader>h",
			function()
				h.ui:toggle_quick_menu(h:list())
			end,
		})
		key.nmap({
			"<C-1>",
			function()
				h:list():select(1)
			end,
		})
		key.nmap({
			"K",
			function()
				h:list():next()
			end,
		})
		key.nmap({
			"J",
			function()
				h:list():prev()
			end,
		})
	end,
}
