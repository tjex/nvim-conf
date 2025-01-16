-- auto commands --
-------------------

local auto = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("custom", { clear = false })

-- Buffers --
--------------

-- setting format options in init.lua is still buggy
-- ft specific foptions in after/ftplugin
local fo_ftypes = { "mail", "markdown" }
auto({ "BufEnter", "BufNewFile" }, {
	group = "custom",
	callback = function()
		local ftype = vim.bo.filetype
		if not vim.tbl_contains(fo_ftypes, ftype) then
			vim.opt_local.fo = "crqn1jp"
		end
	end,
})

auto({ "BufEnter" }, {
	group = "custom",
	callback = function()
		vim.cmd(":FocusToggle")
		vim.cmd(":FocusToggle")
	end,
})

auto({ "BufEnter" }, {
	group = "custom",
	pattern = "*.rem",
	command = "! ~/scripts/progs/calpull.sh",
})

auto({ "BufWritePost" }, {
	group = "custom",
	callback = function()
		require("lint").try_lint()
	end,
})

auto({ "BufWritePost" }, {
	group = "custom",
	callback = function()
		local ftype = vim.bo.filetype
		if ftype ~= "markdown" and ftype ~= "mail" then
			vim.cmd(":FormatWrite")
		end
	end,
})

auto({ "BufWritePost" }, {
	group = "custom",
	pattern = "*.rem",
	command = "! /home/tjex/.local/go/bin/lnch ~/scripts/progs/calpush.sh",
})

-- Term --
----------

auto({ "TermOpen" }, {
	group = "custom",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.scrolloff = 0
	end,
})
