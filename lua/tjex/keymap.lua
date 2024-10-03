-- Modes
--  normal mode = 'n'
--  insert mode = 'i'
--  viaul mode = 'v'
--  visual block mode - 'x'
--  term mode = 't'
--  command mode = 'c'

local M = {}
local default_opts = { noremap = true, silent = true }

M.imap = function(tbl)
	local opts = vim.tbl_extend("force", default_opts, tbl[3] or {})
	vim.keymap.set("i", tbl[1], tbl[2], opts)
end

M.nmap = function(tbl)
	local opts = vim.tbl_extend("force", default_opts, tbl[3] or {})
	vim.keymap.set("n", tbl[1], tbl[2], opts)
end

M.vmap = function(tbl)
	local opts = vim.tbl_extend("force", default_opts, tbl[3] or {})
	vim.keymap.set("v", tbl[1], tbl[2], opts)
end

M.xmap = function(tbl)
	local opts = vim.tbl_extend("force", default_opts, tbl[3] or {})
	vim.keymap.set("x", tbl[1], tbl[2], opts)
end

M.tmap = function(tbl)
	local opts = vim.tbl_extend("force", default_opts, tbl[3] or {})
	vim.keymap.set("t", tbl[1], tbl[2], opts)
end

return M
