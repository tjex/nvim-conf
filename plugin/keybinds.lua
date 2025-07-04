-- neovim native editor keymaps (not plugin specific)
local key = require("tjex.keybind")

local down_screen = "20jzz"
local up_screen = "20kzz"

-- main functionality remaps
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
key.nmap({ "<ESC>", "<Nop>" })
key.nmap({ "<F1>", "<Nop>" })
key.imap({ "kj", "<ESC><Right>" })
key.imap({ "KJ", "<ESC><Right>" })
key.imap({ "<c-l>", "<Nop>" }) -- used for cmp

-- file operations
key.nmap({ "<leader>c", ":Cd<cr>" })
key.nmap({ "<leader>w", ":w<cr>" })

-- text operations
key.nmap({ "<M-k>", "mzJ`z" }) -- append below to current line and leave cursor where it is
key.xmap({ "<leader>p", '"_d<Left>p' }) -- paste over text and keep same item in paste buffer
key.vmap({ "<leader>y", '"+y' }) -- copy to sys clipboard
key.nmap({ "x", '"_x' }) -- stop 'x' from adding to paste
key.nmap({ "Z", "1z=e" })
key.nmap({ "fp", "mzgqap`z" }) -- for latex / txt / plain files that don't have formatters

-- Replace mode using the word you were currently on (thanks to the Primeageon).
key.nmap({ "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/<Left>" })

-- naviagtion
key.nmap({ "j", "gj" }) -- cursor down inline
key.nmap({ "k", "gk" }) -- cursor up inline
key.vmap({ "J", ":m '>+1<CR>gv=gv" }) -- move selected visual lines down
key.vmap({ "K", ":m '<-2<CR>gv=gv" }) -- move selected visual lines up
key.nmap({ "<C-d>", down_screen }) -- keep cursor in middle when jumping
key.nmap({ "<C-u>", up_screen }) -- keep cursor in middle when jumping
key.nmap({ "<C-j>", down_screen })
key.nmap({ "<C-k>", up_screen })
key.nmap({ "n", "nzzzv" }) -- keep cursor in middle during search
key.nmap({ "N", "Nzzzv" })
key.nmap({ "`o", '`"' }) -- jump to where cursor was on file close (`" sucks to type)

-- use keydirections that make sense for commandline menu
vim.cmd([[
  cnoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  cnoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
  cnoremap <expr> <Left> pumvisible() ? "\<Up>" : "\<Left>"
  cnoremap <expr> <Right> pumvisible() ? "\<Down>" : "\<Right>"
]])

-- windows
-- tying out :FocusSplitLeft/Right in place of these.
-- see plugins/focus.lua
key.nmap({ "<C-h>", "<C-w>h" })
key.nmap({ "<C-l>", "<C-w>l" })
key.nmap({ "<C-w>r", "<C-w>r<C-w>h" })
key.nmap({ "H", "<C-w>h<C-w>x<C-w>l" })
key.nmap({ "L", "<C-w>x" })

-- tabs
key.nmap({ "gh", ":tabp<CR>" }) -- previous tab
key.nmap({ "gl", ":tabn<CR>" }) -- next tab

-- buffers
key.nmap({ "<leader>bd", ":bn<bar>sp<bar>bp<bar>bd<CR>" })

-- terminal
key.tmap({ "kj", "<c-\\><c-n>" })
