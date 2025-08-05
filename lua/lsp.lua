require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'bash',
    'c_sharp',
    'go',
    'haskell',
    'lua',
    'python',
    'rust',
    'vim',
    'vimdoc',
    'hyprlang',
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
})

vim.filetype.add({
  pattern = {
    ['.*/hypr/.*%.conf'] = 'hyprlang',
    ['*.tex'] = 'latex',
  },
})


require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pylsp",
    "ltex",
  },
  automatic_installation = true,
})


-- vim.lsp.config( 'lua_ls',  {
--     settings = {
--         Lua = {
--             workspace = {
--                 library = vim.api.nvim_get_runtime_file("", true)
--             }
--         }
--     }
-- })
vim.lsp.config( 'lua_ls',  { })
vim.lsp.enable({ 'lua_ls', 'pylsp' })


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
