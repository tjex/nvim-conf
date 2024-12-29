local key = require("tjex.keybind")
return {
	"nvim-focus/focus.nvim",
	version = "*",
	init = function()
		key.nmap({
			"<C-c>",
			function()
				-- Create balance splits if there's only one window, otherwise
				-- close empty buffers. Effectively a toggle with a saftey net.
				local win_amount = #vim.api.nvim_tabpage_list_wins(0)
				if win_amount == 1 then
					vim.cmd(":vnew")
					vim.cmd(":vnew")
					vim.cmd(":wincmd H")
					vim.cmd(":wincmd l")
					vim.cmd(":FocusToggle")
				else
					local buffers = vim.api.nvim_list_bufs()
					for _, bufnr in ipairs(buffers) do
						if
							vim.api.nvim_buf_is_loaded(bufnr)
							and vim.api.nvim_buf_get_name(bufnr) == ""
							and vim.api.nvim_buf_get_option(bufnr, "buftype") == ""
						then
							local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

							local total_characters = 0

							for _, line in ipairs(lines) do
								total_characters = total_characters + #line
							end

							if total_characters == 0 then
								vim.api.nvim_buf_delete(bufnr, {
									force = true,
								})
							end
						end
					end
				end
			end,
		})
	end,
	config = function()
		require("focus").setup({
			autoresize = { enable = false },
			-- split = {
			-- 	bufnew = true, -- Create blank buffer for new split windows
			-- },
		})
	end,
}
