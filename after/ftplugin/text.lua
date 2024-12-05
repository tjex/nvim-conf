local key = require("tjex.keybind")

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- all mappings set here should be local only
local bufnr = vim.api.nvim_get_current_buf()

key.imap({ "<c-a>", vim.fn.system("arvelie 2020 -c today"), { buffer = bufnr } })
key.imap({ "<c-d>", vim.fn.strftime("%Y-%m-%d"), { buffer = bufnr } })
