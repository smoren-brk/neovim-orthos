local configs = require('nvim-treesitter.configs')

configs.setup({
  ensure_installed = {
    'c',
    'bash',
    'c_sharp',
    'fennel',
    'go',
    'haskell',
    'lua',
    'python',
    'query',
    'rust',
    'vim',
    'vimdoc',
    'hyprlang',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})

vim.filetype.add({
  pattern = {
    ['.*/hypr/.*%.conf'] = 'hyprlang',
  },
})

vim.filetype.add({
  pattern = {
    ['*.tex'] = 'latex',
  },
})

local mason = require("mason")
mason.setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = {
    "fennel_ls",
    "lua_ls",
    "pylsp",
    "ltex",
    "zls",
    "rust_analyzer",
  },
  automatic_installation = true,
})

-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client:supports_method('textDocument/completion') then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })
-- vim.cmd('set completeopt+=noselect')
--
require 'nvim-treesitter.configs'.setup({
	ensure_installed = { 'lua' },
	highlight = { enable = true }
})

vim.lsp.enable({ 'lua_ls' })


require "blink.cmp".setup({
    keymap = {
      preset = 'enter',

      ['<Shift-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },

      -- disable a keymap from the preset
      ['<C-e>'] = false, -- or {}

      -- show with a list of providers
      ['<C-s>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },

    },
    appearance = {
        nerd_font_variant = 'normal'
    },
    completion = {
        documentation = { auto_show = true }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning"
    },
})
