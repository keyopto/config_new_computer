vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<A-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('n', '<A-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('n', '<A-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('n', '<A-l>', [[<Cmd>wincmd l<CR>]])

vim.keymap.set('n', '<leader>vs', "<CMD>vsplit<CR>")
vim.keymap.set('n', '<leader>hs', "<CMD>split<CR>")

vim.keymap.set('n', '<leader>q', '<CMD>q<CR>')

vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
