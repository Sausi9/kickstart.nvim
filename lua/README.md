# Neovim Configuration Structure

This is a modularized Kickstart.nvim configuration organized for easy maintenance and extension.

## Directory Structure

```
lua/
├── config/           # Core Neovim configuration
│   ├── init.lua      # Loads all config modules
│   ├── options.lua   # Editor options (vim.o settings)
│   ├── keymaps.lua   # Key mappings
│   └── autocmds.lua  # Autocommands
├── plugins/          # Plugin specifications
│   ├── init.lua      # Plugin loader (imports all plugin modules)
│   ├── colorscheme.lua   # Theme plugins
│   ├── completion.lua    # Blink.cmp configuration
│   ├── editor.lua        # Editor enhancements (mini.nvim, neoscroll, gitsigns)
│   ├── lsp.lua          # LSP configuration
│   ├── telescope.lua     # Fuzzy finder
│   ├── treesitter.lua    # Syntax highlighting
│   └── ui.lua           # UI plugins (which-key, trouble, conform)
└── themes/           # Custom theme configurations
    └── gruvbox-material.lua  # Custom gruvbox-material setup
```

## How It Works

### Main Entry Point (`init.lua`)
The main `init.lua` in the root loads the configuration in this order:
1. Core configuration (`require 'config'`)
2. Lazy.nvim plugin manager setup
3. Plugin loading (`require('lazy').setup('plugins', ...)`)

### Core Configuration (`lua/config/`)
- **options.lua**: All Neovim settings (line numbers, clipboard, scrolloff, etc.)
- **keymaps.lua**: Global key mappings
- **autocmds.lua**: Autocommands (like highlight on yank)
- **init.lua**: Loads all config modules

### Plugins (`lua/plugins/`)
Each file returns a table (or array of tables) with plugin specifications following the lazy.nvim format.

- **init.lua**: Uses `{ import = 'plugins.X' }` to load all plugin modules
- Each plugin file is self-contained with its configuration and keymaps
- Plugins are lazy-loaded where appropriate (events, commands, etc.)

### Themes (`lua/themes/`)
Custom theme configurations that are loaded by the colorscheme plugin.

## Adding New Plugins

### Method 1: Add to Existing File
Add a new plugin spec to an appropriate file in `lua/plugins/`:

```lua
-- In lua/plugins/editor.lua
return {
  -- ... existing plugins ...
  
  {
    'your-username/your-plugin',
    opts = {
      -- your config
    },
  },
}
```

### Method 2: Create a New File
1. Create a new file in `lua/plugins/` (e.g., `lua/plugins/git.lua`)
2. Return a table with plugin specifications:

```lua
-- lua/plugins/git.lua
return {
  {
    'tpope/vim-fugitive',
    cmd = 'Git',
  },
}
```

3. Import it in `lua/plugins/init.lua`:

```lua
return {
  -- ... existing imports ...
  { import = 'plugins.git' },
}
```

## Adding New Keymaps

- **Global keymaps**: Add to `lua/config/keymaps.lua`
- **Plugin-specific keymaps**: Add within the plugin's config in its plugin file

## Adding New Options

Add to `lua/config/options.lua`:

```lua
vim.o.your_option = value
```

## Switching Colorschemes

Edit `lua/plugins/colorscheme.lua`:
- Set `enabled = false` on the theme you don't want
- Set `enabled = true` on the theme you want to use
- Or comment/uncomment themes

## Benefits of This Structure

1. **Separation of concerns**: Options, keymaps, and plugins are in separate files
2. **Easy to navigate**: Find what you need quickly
3. **Modular**: Add/remove features without affecting others
4. **Lazy loading**: Plugins load only when needed
5. **Git-friendly**: Changes are isolated to specific files
6. **Scalable**: Easy to add more plugins and configurations

## Backup

The original `init.lua` is backed up as `init.lua.backup` in the root directory.
