--
-- user commands
--

local usr_cmd = vim.api.nvim_create_user_command
local funcs = require("tjex.funcs")

-- run a file on write and print its output to designated buf
usr_cmd("AutoRunOut", function()
	local bufnr = vim.fn.input("Bufnr: ")
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.split(vim.fn.input("Command: "), " ")
	funcs.attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})

usr_cmd("AutoRun", function()
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.split(vim.fn.input("Command: "), " ")
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("autorun", { clear = true }),
		pattern = pattern,
		callback = function()
			vim.fn.jobstart(command)
		end,
	})
end, {})

usr_cmd("Xmod", ":silent !chmod +x %", { desc = "Make the current file executable: i.e, chmod +x" })
usr_cmd("Cd", function()
	local dir = vim.fn.expand("%:p:h")
	vim.cmd("cd " .. dir)
end, { desc = "cd into the current file's directory." })

-- git worktree
usr_cmd("WorktreeCreate", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {})
usr_cmd("Worktree", ":lua require('telescope').extensions.git_worktree.git_worktrees()", {})
usr_cmd("Rd", ":lua require('persistence').load()<cr>", {})
usr_cmd("Rs", ":lua require('persistence').load({last = true})<cr>", {})
