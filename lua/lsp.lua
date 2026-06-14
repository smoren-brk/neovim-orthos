local treesitter = require('nvim-treesitter')

treesitter.install({
  'bash',
  'lua',
  'python',
  'rust',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
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


-- vim.lsp.config( 'lua_ls',  {
--     settings = {
--         Lua = {
--             workspace = {
--                 library = vim.api.nvim_get_runtime_file("", true)
--             }
--         }
--     }
-- })

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.list_extend(
                    vim.api.nvim_get_runtime_file("", true),
                    { "/usr/share/hypr/stubs" }
                )
            },
            diagnostics = {
                globals = { "hl" }
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
