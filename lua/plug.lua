local plugins = {
	{ src = 'https://github.com/catppuccin/nvim' },
	{ src = 'https://github.com/echasnovski/mini.cursorword' },
	{ src = 'https://github.com/echasnovski/mini.pick' },
	{ src = 'https://github.com/echasnovski/mini.starter' },
	{ src = 'https://github.com/echasnovski/mini.trailspace' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/svampkorg/moody.nvim' },

	{ src = 'https://github.com/nvim-lualine/lualine.nvim',
        deps = { { src = 'https://github.com/nvim-tree/nvim-web-devicons' } }},

	{ src = 'https://github.com/williamboman/mason.nvim',
        deps = { { src = 'https://github.com/williamboman/mason-lspconfig.nvim',
                 { src = 'https://github.com/neovim/nvim-lspconfig' }} }},

    { src = 'https://github.com/Saghen/blink.cmp',
        version = "v1.6.0",
        deps = { { src = 'https://github.com/rafamadriz/friendly-snippets' } }},
}

local function flatten_plugins(plugins)
  local result = {}

  local function flatten(t)
    for _, plugin in ipairs(t) do
      -- Copy plugin to avoid modifying original input
      local p = {}
      for k, v in pairs(plugin) do
        if k ~= "deps" then
          p[k] = v
        end
      end
      table.insert(result, p)

      -- If there are dependencies, flatten them recursively
      if plugin.deps then
        flatten(plugin.deps)
      end
    end
  end

  flatten(plugins)
  return result
end

local plugs = flatten_plugins(plugins)

vim.pack.add(plugs)



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


require 'mini.pick'.setup()
require 'mini.cursorword'.setup()
require 'mini.starter'.setup()
require 'mini.trailspace'.setup()
require 'moody'.setup()
require 'oil'.setup()


require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  }
})

