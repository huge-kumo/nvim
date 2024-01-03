local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- remap space as leader key
keymap('', '<space>', '<nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('t', '<C-h>', [[<cmd>wincmd h<cr>]], opts)
keymap('t', '<C-j>', [[<cmd>wincmd j<cr>]], opts)
keymap('t', '<C-k>', [[<cmd>wincmd k<cr>]], opts)
keymap('t', '<C-l>', [[<cmd>wincmd l<cr>]], opts)

-- split window
keymap('n', 'ss', '<cmd>split<cr>', opts)
keymap('n', 'sv', '<cmd>vsplit<cr>', opts)

keymap('t', '<esc>', [[<C-\><C-n>]], opts)
keymap('n', '<leader>q', ':quit<cr>', opts)
keymap('n', '<leader>Q', ':quit!<cr>', opts)
keymap('n', '<leader>/', ':nohlsearch<cr>', opts)
keymap('n', '<leader>bd', ':bd<cr>', opts)
keymap('n', '<leader>bD', ':bd!<cr>', opts)
keymap('n', ';', ':')
