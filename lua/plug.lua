local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        error('Failed to clone lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'catppuccin/nvim',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    {
        'vuki656/review.nvim',
        lazy = true,
        cmd = 'Review',
    },
    {
        'sindrets/diffview.nvim',
        lazy = true,
        cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    },

    {
        'OXY2DEV/markview.nvim',
        config = true,
    },

    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        event = { 'BufReadPre', 'BufNewFile' },
        config = true,
    },

    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        cmd = 'Telescope',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = true,
    },

    {
        'renerocksai/telekasten.nvim',
        lazy = true,
        cmd = 'Telekasten',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telekasten').setup({
                home = vim.fn.expand("~/zettelkasten"),
            })
        end,
    },

    {
        'echasnovski/mini.cursorword',
        lazy = true,
        event = 'VeryLazy',
        config = true,
    },

    {
        'echasnovski/mini.starter',
        config = true,
    },

    {
        'echasnovski/mini.trailspace',
        config = true,
    },

    {
        'barrettruth/canola.nvim',
        branch = 'main',
        main = 'oil',
        config = true,
    },

    {
        'svampkorg/moody.nvim',
        config = true,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                }
            })
        end,
    },

    {
        'williamboman/mason.nvim',
        dependencies = {
            'neovim/nvim-lspconfig'
        },
        config = true,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        config = true,
    },

    {
        'Saghen/blink.cmp',
        version = "v1.6.0",
        dependencies = { 'rafamadriz/friendly-snippets' },
    },
}

require('lazy').setup(plugins, {
    -- Keep the generated lockfile writable when the config lives in the Nix store.
    lockfile = vim.fn.stdpath('state') .. '/lazy-lock.json',
    defaults = {
        lazy = false,
    },
})



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
