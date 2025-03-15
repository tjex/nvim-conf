-- markdown specific settings
-- local key = vim.api.nvim_set_keymap
local cmd = require("zk.commands")
local key = require("tjex.keybind")
local util = require("tjex.util")

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt_local.spell = true

-- all mappings set here should be local only
local bufnr = vim.api.nvim_get_current_buf()

key.imap({ "<c-d>", vim.fn.strftime("%Y-%m-%d"), { buffer = bufnr } })
key.imap({
	"<c-e>",
	function()
		local url = vim.fn.input("link: ")
		-- local title = vim.fn.input("ref type: ")
		local link = util.build_md_link(url)
		vim.api.nvim_put({ link }, "c", false, true)
	end,
	{ buffer = bufnr },
})
key.imap({
	"<c-c>",
	function()
		local ref = vim.fn.input("ref: ")
		vim.api.nvim_put({ "~ " .. ref, "", "...", "" }, "l", false, true)
	end,
	{ buffer = bufnr },
})
