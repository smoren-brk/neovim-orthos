require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'lua',
    'python',
    'rust',
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  modules = {},
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
  },
  automatic_installation = true,
})


vim.lsp.config( 'lua_ls',  {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})
vim.lsp.enable({ 'lua_ls', 'pylsp', 'csharp_ls' })

vim.diagnostic.config({
  signs = false,
  virtual_text = {
    prefix = '●',
    spacing = 2,
  },
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
})


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
