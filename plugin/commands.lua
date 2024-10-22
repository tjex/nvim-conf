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

usr_cmd("Publish", function()
	local message = vim.fn.input("Commit message: ")
	vim.cmd(":cd %:p:h") -- cd into blog directory as precaution
	vim.cmd(":Git add %")
	vim.cmd(":Git commit -m " .. "'" .. message .. "'")
	vim.cmd(":! make ../../.. deploy")
end, {})
usr_cmd("Dapui", ":lua require('dapui').toggle()<CR>", {})
usr_cmd(
	"Conf",
	":lua require('telescope.builtin').find_files({cwd='~/.config/nvim/', previewer=false})<CR>",
	{}
)
usr_cmd("Chmod", ":silent !chmod +x %", {})

-- git worktree
usr_cmd("WorktreeCreate", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {})
usr_cmd("Worktree", ":lua require('telescope').extensions.git_worktree.git_worktrees()", {})
usr_cmd("Rd", ":lua require('persistence').load()<cr>", {})
usr_cmd("Rs", ":lua require('persistence').load({last = true})<cr>", {})

-- gen
usr_cmd("GenSelectModel", require("gen").select_model, {})
