return {
	"nanozuki/tabby.nvim",
	enabled = false,
	event = "VimEnter",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local key = require("tjex.keybind")
		-- configs...
		local theme = {
			fill = "TabLineFill",
			-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
			head = "TabLine",
			current_tab = "TabLineSel",
			tab = "TabLine",
			win = "TabLine",
			tail = "TabLine",
		}
		key.nmap({ "<A-l>", ":tabn<CR>" })
		key.nmap({ "<A-h>", ":tabn<CR>" })
		key.nmap({ "<A-6>", "g<Tab>" }) -- switch to last tab
		key.nmap({ "<leader>to", ":tabonly<CR>" })
		key.nmap({ "<leader>tn", ":tabnew<CR>" })
		key.nmap({ "<leader>tc", ":tabclose<CR>" })
		key.nmap({
			"<leader>tr",
			function()
				local name = vim.fn.input("New name: ")
				vim.cmd(":TabRename" .. " " .. name)
			end,
		})
		key.nmap({ "<leader>th", ":-tabmove<CR>" })
		key.nmap({ "<leader>tl", ":+tabmove<CR>" })
		require("tabby").setup({
			line = function(line)
				return {
					{
						{ "  ", hl = theme.head },
						line.sep("", theme.head, theme.fill),
					},
					line.tabs().foreach(function(tab)
						local hl = tab.is_current() and theme.current_tab or theme.tab
						return {
							line.sep("", hl, theme.fill),
							-- tab.number(),
							tab.in_jump_mode() and tab.jump_key(),
							tab.name(),
							line.sep("", hl, theme.fill),
							hl = hl,
							margin = " ",
						}
					end),
					-- line.spacer(),
					-- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
					-- 	return {
					-- 		line.sep("", theme.win, theme.fill),
					-- 		win.is_current() and "" or "",
					-- 		win.buf_name(),
					-- 		line.sep("", theme.win, theme.fill),
					-- 		hl = theme.win,
					-- 		margin = " ",
					-- 	}
					-- end),
					-- {
					-- 	line.sep("", theme.tail, theme.fill),
					-- 	{ "  ", hl = theme.tail },
					-- },
					hl = theme.fill,
				}
			end,
			-- option = {}, -- setup modules' option,
		})
	end,
}
