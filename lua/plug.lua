local pack = require 'pack'

local plugins = {
	'catppuccin/nvim',
	'nvim-treesitter/nvim-treesitter',
    { url = 'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      setup = true },

    { url = 'renerocksai/telekasten.nvim',
      dependencies = { 'nvim-telescope/telescope.nvim' },
      setup = function()
        require('telekasten').setup({
          home = vim.fn.expand("~/zettelkasten"),
        })
      end },

	{ url = 'echasnovski/mini.cursorword',
	  setup = true },

	{ url = 'echasnovski/mini.pick',
	  setup = true },

	{ url = 'echasnovski/mini.starter',
	  setup = true },

	{ url = 'echasnovski/mini.trailspace',
	  setup = true },

	{ url = 'stevearc/oil.nvim',
	  setup = true },

	{ url = 'svampkorg/moody.nvim',
	  setup = true },

	{ url = 'greggh/claude-code.nvim',
	  setup = function ()
        require("claude-code").setup({
          window = {
            position = "float",
            float = {
              width = "70%",
              height = "60%",
              row = "60%",
              col = "center",
              relative = "editor",
              border = "rounded",
            },
          },
        })
	  end },

	{ url = 'nvim-lualine/lualine.nvim',
	  dependencies = { 'nvim-tree/nvim-web-devicons' },
	  setup = function ()
	    require('lualine').setup({
	      options = {
	        section_separators = { left = '', right = '' },
	        component_separators = { left = '', right = '' },
	      }
	    })
	  end },

	{ url = 'williamboman/mason.nvim',
	  dependencies = {
	    { url = 'williamboman/mason-lspconfig.nvim', setup = true },
	    'neovim/nvim-lspconfig'
	  },
	  setup = true },

	{ url = 'Saghen/blink.cmp',
	  version = "v1.6.0",
	  dependencies = { 'rafamadriz/friendly-snippets' }},
}

pack.setup(plugins)



-- Conceal 'lambda' with 'λ'
vim.cmd([[syntax match keyword '\<lambda\>' conceal cchar=λ]])
vim.opt.conceallevel = 1

-- List of default plugins to disable
local default_plugins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'tutor',
  'rplugin',
  'syntax',
  'synmenu',
  'optwin',
  'compiler',
  'bugreport',
  'ftplugin'
}

for _, plug in ipairs(default_plugins) do
    vim.g['loaded_' .. plug] = 1
end




