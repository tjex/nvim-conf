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

-- balance splits
auto({ "BufEnter" }, {
	group = "custom",
	callback = function()
		vim.cmd(":FocusToggle")
		vim.cmd(":FocusToggle")
	end,
	desc = "Balance splits.",
})

-- cd into file's directory on enter
auto({ "BufEnter" }, {
	group = "custom",
	callback = function()
		if vim.bo.filetype ~= "oil" then
			vim.cmd("Cd")
		end
	end,
	desc = "Cd into current file's directory.",
})

auto({ "BufWritePost" }, {
	group = "custom",
	callback = function()
		require("lint").try_lint()
	end,
	desc = "Try to lint.",
})

auto({ "BufWritePost" }, {
	group = "custom",
	pattern = "*.rem",
	command = "! /home/tjex/.local/go/bin/lnch ~/scripts/progs/calpush.sh",
	desc = "Push changes to .rem (calendar) file.",
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

auto({ "BufEnter", "TermOpen" }, {
	group = "custom",
	pattern = "term://*",
	command = "startinsert",
})

auto({ "BufEnter" }, {
	group = "custom",
	pattern = "*.rem",
	command = "! ~/scripts/progs/calpull.sh",
})
