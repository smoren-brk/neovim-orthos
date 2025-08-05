local pack = require 'pack'

local plugins = {
	'https://github.com/catppuccin/nvim',
	'https://github.com/nvim-treesitter/nvim-treesitter',

	{ url = 'https://github.com/echasnovski/mini.cursorword',
	  setup = true },

	{ url = 'https://github.com/echasnovski/mini.pick',
	  setup = true },

	{ url = 'https://github.com/echasnovski/mini.starter',
	  setup = true },

	{ url = 'https://github.com/echasnovski/mini.trailspace',
	  setup = true },

	{ url = 'https://github.com/stevearc/oil.nvim',
	  setup = true },

	{ url = 'https://github.com/svampkorg/moody.nvim',
	  setup = true },

	{ url = 'https://github.com/greggh/claude-code.nvim',
	  setup = true },

	{ url = 'https://github.com/nvim-lualine/lualine.nvim',
	  dependencies = { 'https://github.com/nvim-tree/nvim-web-devicons' },
	  setup = function()
	    require('lualine').setup({
	      options = {
	        section_separators = { left = '', right = '' },
	        component_separators = { left = '', right = '' },
	      }
	    })
	  end },

	{ url = 'https://github.com/williamboman/mason.nvim',
	  dependencies = {
	    { url = 'https://github.com/williamboman/mason-lspconfig.nvim', setup = true },
	    'https://github.com/neovim/nvim-lspconfig'
	  },
	  setup = true },

	{ url = 'https://github.com/Saghen/blink.cmp',
	  version = "v1.6.0",
	  dependencies = { 'https://github.com/rafamadriz/friendly-snippets' }},
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




