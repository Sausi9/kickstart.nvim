--[[
=====================================================================
==================== MODULAR KICKSTART.NVIM =========================
=====================================================================

This is a modular version of Kickstart.nvim. The configuration is
organized into logical modules for easier maintenance and extension.

Structure:
  lua/
  ├── config/           - Core Neovim configuration
  │   ├── options.lua   - Editor options (vim.o settings)
  │   ├── keymaps.lua   - Key mappings
  │   └── autocmds.lua  - Autocommands
  ├── plugins/          - Plugin specifications
  │   ├── init.lua      - Plugin loader
  │   ├── colorscheme.lua
  │   ├── completion.lua
  │   ├── editor.lua
  │   ├── lsp.lua
  │   ├── telescope.lua
  │   ├── treesitter.lua
  │   └── ui.lua
  └── themes/           - Custom theme configurations
      └── gruvbox-material.lua

To add new plugins:
  - Create a new file in lua/plugins/ or add to an existing one
  - Each file should return a table (or array of tables) with plugin specs
  - Import it in lua/plugins/init.lua

See `:help lazy.nvim` for plugin configuration details.
--]]

-- Load core configuration
require 'config'


-- [[ Install lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Load plugins ]]
-- All plugin specifications are in lua/plugins/
require('lazy').setup('plugins', {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
