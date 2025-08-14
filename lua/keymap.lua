local term = require('term')

local keymaps = {
  -- Normal mode mappings
  { 'n', '<leader>gd', vim.lsp.buf.hover, { noremap = true } },
  { 'n', '<leader>tw', function() MiniTrailspace.trim() end, { noremap = true } },

  -- Terminal and buffer mappings
  { 'n', '<leader>tt', term.toggle_popup_terminal, { noremap = true } },
  { 'n', '<leader>th', term.toggle_popup_terminal, { noremap = true } },
  { 't', '<Esc>', '<C-\\><C-n>', { noremap = true } },
  { 'n', '<C-Space>', '<cmd>bprev<CR>', { noremap = true } },

  -- Move selected text up/down in visual mode
  { 'v', 'J', "<cmd>m '>+1<CR>gv=gv", { noremap = true } },
  { 'v', 'K', "<cmd>m '<-2<CR>gv=gv", { noremap = true } },

  -- Keep cursor in the middle when jumping or joining lines
  { 'n', 'J', 'mzJ`z', { noremap = true } },
  { 'n', '<C-d>', '<C-d>zz', { noremap = true } },
  { 'n', '<C-u>', '<C-u>zz', { noremap = true } },
  { 'n', 'n', 'nzzzv', { noremap = true } },
  { 'n', 'N', 'Nzzzv', { noremap = true } },

  -- Telescope mappings
  { 'n', '<leader>ff', '<cmd>Telescope find_files<CR>' },
  { 'n', '<leader>fb', '<cmd>Telescope buffers<CR>' },
  { 'n', '<leader>fh', '<cmd>Telescope help_tags<CR>' },
  { 'n', '<leader>fg', '<cmd>Telescope live_grep<CR>' },
  { 'n', '<leader>fs', '<cmd>Telescope git_status<CR>' },
  { 'n', '<leader>ft', '<cmd>Telescope<CR>' },

  -- Telekasten mappings
  { 'n', '<leader>tk', '<cmd>Telekasten<CR>' },
  { 'n', '<leader>tf', '<cmd>Telekasten find_notes<CR>' },
  { 'n', '<leader>ts', '<cmd>Telekasten search_notes<CR>' },
  { 'n', '<leader>tn', '<cmd>Telekasten new_note<CR>' },
  { 'n', '<leader>tlf', '<cmd>Telekasten follow_link<CR>' },
  { 'n', '<leader>tli', '<cmd>Telekasten insert_link<CR>' },

  -- File operations
  { 'n', '<leader>e', '<cmd>Oil<CR>' },
  { 'n', '<leader>lf', vim.lsp.buf.format },

  -- Basic operations
  { 'n', '<leader>o', '<cmd>update<CR> <cmd>source<CR>' },
  { 'n', '<leader>w', '<cmd>write<CR>' },
  { 'n', '<leader>q', '<cmd>quit<CR>' },

  -- Copy/delete to system clipboard
  { { 'n', 'v', 'x' }, '<leader>y', "'+y<CR>" },
  { { 'n', 'v', 'x' }, '<leader>d', "'+d<CR>" },

  -- Claude Code
  { 'n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' } },
}

for _, keymap in ipairs(keymaps) do
  vim.keymap.set(keymap[1], keymap[2], keymap[3], keymap[4])
end
