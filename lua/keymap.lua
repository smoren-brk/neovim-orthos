-- Normal mode mappings
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.hover, { noremap = true })
vim.keymap.set('n', '<leader>tw', function() MiniTrailspace.trim() end, { noremap = true })

-- Terminal and buffer mappings
vim.keymap.set('n', '<leader>tt', '<cmd>terminal<CR>', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<C-Space>', '<cmd>bprev<CR>', { noremap = true })

-- Move selected text up/down in visual mode
vim.keymap.set('v', 'J', "<cmd>m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set('v', 'K', "<cmd>m '<-2<CR>gv=gv", { noremap = true })

-- Keep cursor in the middle when jumping or joining lines
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true })



vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<CR>')
vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>Pick help<CR>')
vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>o', '<cmd>update<CR> <cmd>source<CR>')
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>quit<CR>')

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', "'+y<CR>")
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', "'+d<CR>")

vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })
