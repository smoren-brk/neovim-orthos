# Neovim Configuration

A modern, minimal Neovim configuration built around Neovim's native package management with custom plugin handling.

## Features

- **Native Package Management**: Uses Neovim's built-in `vim.pack` for plugin management
- **Custom Plugin System**: Custom `pack.lua` module for simplified plugin configuration
- **Modern UI**: Catppuccin colorscheme with transparency and custom color overrides
- **LSP Integration**: Full Language Server Protocol support with Mason for easy installation
- **Smart Completion**: Blink.cmp for fast, intelligent autocompletion
- **Efficient Navigation**: Mini.pick for fuzzy finding, Oil.nvim for file management
- **Syntax Highlighting**: Treesitter with support for multiple languages

## Plugin Highlights

- **Colorscheme**: Catppuccin (Macchiato flavor) with custom transparency
- **LSP**: Mason + nvim-lspconfig for language servers
- **Completion**: Blink.cmp with snippet support
- **File Management**: Oil.nvim for directory editing
- **Status Line**: Lualine with clean separators
- **Development**: Claude Code integration for AI assistance

## pack.lua

`pack.lua` is a custom plugin management wrapper that bridges the gap between modern plugin managers (like lazy.nvim) and Neovim's native package system. It provides:

### Key Features
- **Lazy.nvim-compatible syntax**: Write plugin specs similar to lazy.nvim
- **Dependency resolution**: Automatically handles nested plugin dependencies
- **Auto-setup**: Automatically calls `setup()` functions with provided options
- **URL flexibility**: Supports various URL formats and naming conventions

### Use Case
Perfect for users who want the simplicity of native Neovim package management without sacrificing the convenience of modern plugin configuration patterns. Instead of manually managing `vim.pack.add()` calls and setup functions, you can define plugins declaratively:

```lua
local plugins = {
    'https://github.com/catppuccin/nvim',

    { url = 'https://github.com/echasnovski/mini.pick',
      setup = true },

    { url = 'https://github.com/nvim-lualine/lualine.nvim',
      dependencies = { 'https://github.com/nvim-tree/nvim-web-devicons' },
      setup = function()
        require('lualine').setup({ /* config */ })
      end }
}
```

The module handles the complexity of dependency ordering, plugin loading, and setup calls automatically.

## Key Bindings

- **Leader**: `<Space>`
- **File Navigation**: `<leader>ff` (files), `<leader>e` (Oil)
- **LSP**: `<leader>gd` (hover), `<leader>lf` (format)
- **Terminal**: `<leader>tt` (new terminal)
- **Claude Code**: `<leader>cc` (toggle AI assistant)

## Configuration Structure

```
lua/
├── colors.lua      # Catppuccin theme configuration
├── keymap.lua      # Key mappings
├── lsp.lua         # LSP and completion setup
├── options.lua     # Vim options and settings
├── pack.lua        # Custom plugin management system
└── plug.lua        # Plugin definitions and setup
```
