local opts = {
    autoindent = true,
    backup = false,
    clipboard = 'unnamedplus',
    -- cmdheight = 0,
    compatible = false,
    cursorline = true,
    expandtab = true,
    hlsearch = true,
    ignorecase = true,
    inccommand = 'split',
    incsearch = true,
    list = true,
    mouse = 'v',
    number = true,
    relativenumber = true,
    shiftwidth = 4,
    showmatch = true,
    signcolumn = 'yes',
    -- signcolumn = 'yes:1',
    smartindent = true,
    smarttab = false,
    softtabstop = 4,
    splitbelow = true,
    splitkeep = 'screen',
    splitright = true,
    startofline = false,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    ttyfast = true,
    undofile = true,
    wildmode = 'longest,list',
    winborder = 'rounded',
    wrap = false,
    background = 'dark',
}

for option, value in pairs(opts) do
    vim.o[option] = value
end

vim.g.mapleader = ' '
vim.cmd.colorscheme('catppuccin')

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
