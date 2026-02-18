# Neovim Configuration Structure

This config is organized around two ideas:

- `lua/core/` for editor core behavior (options, keymaps, autocmds)
- `lua/plugins/` with one plugin spec per file

## Directory Structure

```text
lua/
├── core/
│   ├── init.lua
│   ├── options.lua
│   ├── keymaps.lua
│   └── autocmds.lua
├── config/
│   └── ...            # Backward-compat shim modules forwarding to core/
├── plugins/
│   ├── init.lua       # Imports plugin files explicitly
│   ├── blink-cmp.lua
│   ├── nvim-lspconfig.lua
│   ├── telescope.lua
│   ├── treesitter.lua
│   └── ...            # One file per plugin
└── themes/
    └── gruvbox-material.lua
```

## Load Order

1. `init.lua` loads `require('core')`
2. `lazy.nvim` is initialized
3. `require('lazy').setup('plugins', ...)` loads plugin imports from `lua/plugins/init.lua`

## Adding a Plugin

1. Create `lua/plugins/<plugin-name>.lua`
2. Return one Lazy spec table in that file
3. Add `{ import = 'plugins.<plugin-name>' }` to `lua/plugins/init.lua`

Example:

```lua
return {
  'tpope/vim-fugitive',
  cmd = 'Git',
}
```

## Core vs Plugin Placement

- Put global editor behavior in `lua/core/*`
- Put plugin-specific keymaps/config/options in that plugin's file under `lua/plugins/*`
