vim.g.mapleader = " "

-- window navigation
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- keep cursor in the middle when scrolling half
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- keep search term in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move selected line with J and K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- keep cursor in the same place when using J
vim.keymap.set("n", "J", "mzJ`z")

-- paste into selection and keep original paste text
vim.keymap.set("x", "<leader>p", '"_dP')

-- yank into system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- delete to void
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- format file
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format)

-- show gitsigns hunk
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")

-- show line blame
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>")
